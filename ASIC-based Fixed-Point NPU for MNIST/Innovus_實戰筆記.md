# Innovus 學習筆記

## 1. Floorplan (佈局規劃)

### 物理意義
Floorplan 是 ASIC 設計流程中的第一步物理設計。它的主要目的是定義晶片的形狀、大小以及核心 (Core) 的區域。
- **Core Area**: 放置標準單元 (Standard Cells) 和巨集 (Macros) 的區域。
- **IO Boundary**: 晶片的邊界，通常用於放置 IO Pad。
- **Utilization (使用率)**: Core 區域中被標準單元佔用的比例。通常設定在 0.6 ~ 0.8 (60% ~ 80%) 之間，預留空間給 Routing 和 Buffer。
- **Aspect Ratio (長寬比)**: Core 的高度除以寬度 (H/W)。1.0 代表正方形。
- **Margins (邊距)**: Core 到 IO Boundary 的距離，用於放置 Power Ring。

### Innovus 指令 (v16.2)
在 Innovus 中，我們使用 `floorPlan` 指令來設定。

```tcl
floorPlan -site <site_name> \
          -r <aspect_ratio> <utilization> \
          <left_margin> <bottom_margin> <right_margin> <top_margin>
```

例如：
```tcl
floorPlan -site CoreSite -r 1.0 0.7 30 30 30 30
```
這代表：
- 使用 `CoreSite` (通常在 LEF 檔定義)。
- 長寬比 1.0 (正方形)。
- 使用率 0.7 (70%)。
- 上下左右邊距皆為 30 um。

### 常見問題與觀念釐清 (Q&A)

#### Q1: 為什麼改變 Core Utilization，晶片面積 (Die Size) 會變？
這是因為在 `Specify Floorplan` 設定中，你選擇了 **"Core Size by: Aspect Ratio"** 模式。
- 在這個模式下，Innovus 的邏輯是：「請幫我算出需要多大的面積，才能剛好達到這個使用率？」
- **公式概念**：Core Area = Total Cell Area / Utilization
- **現象**：
    - 如果你設定 **Utilization = 0.15 (15%)**：代表你希望晶片很空，只有 15% 是東西。Innovus 為了讓晶片變空，必須把**面積拉得非常大**。
    - 如果你設定 **Utilization = 0.70 (70%)**：代表你希望晶片塞得緊湊一點。Innovus 就會把**面積縮小**。
- **解決方法**：如果你希望「面積固定」，請在設定時改選 **"Dimension"** 或 **"Die/IO/Core Coordinates"**，這樣面積就會固定，而 Utilization 則會變成一個結果（顯示目前塞了多少）。

#### Q2: 介面上的粉紅色區塊和 "TU=15%" 是什麼意思？
- **粉紅色區塊**：這些通常代表設計中的 **Modules (模組)** 或 **Guides**。Innovus 根據你的 Netlist 階層結構 (Hierarchy)，預先顯示這些模組的大概位置。
- **TU (Target Utilization)**：目標使用率。
- **TU=15%**：代表**該特定區塊內**的標準單元擺放密度目標是 15%。
    - 這不是加總，而是個別區塊的設定。
    - 15% 非常低，這通常是因為你在前面設了全域的 Core Utilization 是 0.15 (圖一的設定)，或者工具在初始狀態下預設給每個模組很寬鬆的空間。
    - 這也解釋了為什麼圖三看起來那麼空（黑色區域很大），因為你給了它很大的空間去擺很少的東西。

#### Q3: 沒有 IO Pad 的設計，Core 和 Die 可以設一樣大嗎？
- **不建議設成完全一樣 (0 Margin)**。
- **原因**：
    1.  **Power Ring (電源環)**：通常我們會圍繞著 Core 畫一圈 VDD/VSS 的 Power Ring。如果 Core = Die，這圈 Ring 就會畫在晶片的最邊緣，甚至超出邊界，這在物理驗證 (DRC) 時很容易出問題。
    2.  **Pin Placement (接腳)**：即使是 Block Level 設計，Pin 通常會放在邊界上。留一點空間 (Margin) 可以讓 Pin 的走線更順暢，不會直接撞到內部的標準元件。
- **建議**：即使是純 Core 設計，也建議留 **5um ~ 10um** 的 Margin。
    - 設定方法：在 `Core Margins by: Core to IO Boundary` 中，上下左右都填入 `5` 或 `10`。

## 2. 從 Genus 到 Innovus：如何決定 Floorplan 大小？

### Genus 報告解讀
根據你的 Genus 報告 (Table 2)：
- **Std-cell area**: 297,201 um^2 (這是所有標準元件加起來的總面積，**最重要**)
- **Total area**: 614,590 um^2 (這包含了 Genus 估算的連線面積，Floorplan 時**不要**直接用這個除)

### 計算合理的 Core Area
Innovus 的 Utilization 計算公式是：
Utilization = (Std Cell Area + Macro Area) / Core Area

如果你設定 **Utilization = 0.7 (70%)**，Innovus 會這樣算：
Core Area = 297,201 / 0.7 ≈ 424,572 um^2
Side Length = √424,572 ≈ 651 um
所以，Innovus 自動幫你算出的 655 x 648 (約 650見方) 是**完全正確且合理**的。

### 為什麼 70% 會爆幾十萬個 DRC？
如果你的面積計算是合理的，但 DRC 卻爆掉，通常**不是因為面積太小**，而是以下原因：

1.  **Routing Layers (金屬層數) 不夠**：
    - 20萬個 Gate 在 45nm 是一個中型設計。如果你的製程有 8 層金屬 (M1-M8)，但你只開放了 M1-M3 給工具走線，那一定會塞爆 (Congestion)，導致無數的 Short/Open DRC。
    - **檢查點**：確認你的 `.lef` 檔定義了幾層金屬？你的 `routeDesign` 指令是否限制了最高層？

2.  **Power Grid (電源網格) 太密**：
    - 如果你的 VDD/VSS 線 (Stripes) 畫得太密或太寬，佔用了太多訊號線的空間，也會導致訊號線走不過去。

3.  **Pin Access (接腳路徑) 問題**：
    - 標準元件太密 (70% 其實還好，不算太高)，導致元件的 Pin 很難連出來。

### 建議流程 (Standard Workflow)
不要直接降到 15%，那是掩耳盜鈴。請試試看：
1.  設定 **Utilization = 0.6 (60%)** 作為起點。
2.  做完 `Place` (擺放元件) 後，**立刻檢查 Congestion (擁擠度)**。
    - 指令：`checkPlace` 或在 GUI 上看 Congestion Map。
    - 如果看到一大片**紅色**，代表該區域走線資源不足。
3.  檢查你的 **Routing Layer 設定**。
    - 確保你有用到 M1 到 M6 或 M8 (視製程而定)。

## 3. Pin Placement (接腳規劃)

### 腳位分析 (基於你的 VHDL)
根據你的程式碼，我們可以把腳位分成兩大類：**輸入 (Input)** 和 **輸出 (Output)**。

#### 1. 左側 (Left) - 輸入介面 (AXI Slave)
通常我們習慣「左進右出」。把所有跟輸入有關的訊號放在左邊。
- `s_axi_aclk` (**重要：Use 屬性要改成 CLOCK**)
- `s_axi_aresetn` (重置)
- `axis_in_data` (32-bit 資料輸入)
- `axis_in_data_valid` (資料有效訊號)
- `axis_in_data_ready` (雖然是 output，但它是跟著 input protocol 走的 handshake 訊號，建議跟 input 放一起)

#### 2. 右側 (Right) - 輸出介面 (Result)
- `class_id` (4-bit 分類結果)
- `class_valid` (結果有效訊號)

#### 3. 上下側 (Top/Bottom) - 電源 (Power)
如果你的 Pin Editor 裡有出現 VDD/VSS，建議把它們分開放在上下，避免跟訊號線搶位置。
- `VDD`: Top
- `VSS`: Bottom

### Metal Layer 選擇指南
這是一個通用的規則 (Rule of Thumb)，可以避免 Routing 時打結：

| 邊界位置 | 建議金屬層 (Layer) | 原因 |
| :--- | :--- | :--- |
| **Left / Right** | **Metal 3 (Horizontal)** | 因為訊號要從左右進來，需要「水平」的金屬線。M3 通常是水平走的。 |
| **Top / Bottom** | **Metal 4 (Vertical)** | 因為訊號要從上下進來，需要「垂直」的金屬線。M4 通常是垂直走的。 |

> **進階觀念：為什麼電源 (Power) 跟訊號 (Signal) 的方向邏輯不一樣？**
>
> 這裡用 Top/Bottom (上下邊) 來舉例解釋原理 (雖然你的訊號線都在左右邊)：
> 1.  **訊號線 (Signal)**：如果是從 Top 進來，我們希望它像箭一樣**垂直射入**，所以會選垂直層 (如 M4)。
> 2.  **電源線 (Power)**：如果是從 Top 進來，我們希望它像護城河一樣**平行圍繞**，所以會選水平層 (如 M5)。
>
> **回到你的設定**：
> - 你的訊號線都在 **Left/Right**，所以選 **M3 (水平)** 是對的 (垂直射入左右邊界)。
> - 你的電源線在 **Top/Bottom**，所以選 **M5 (水平)** 也是對的 (平行圍繞上下邊界)。
> - 結論：你的設定完全正確，不用擔心！

> **注意**：如果你的製程定義 M3 是垂直、M4 是水平，那就反過來。你可以看 Innovus 介面右邊的 Layer 控制面板，通常會有箭頭指示方向。

### Pin Editor 操作步驟
1.  **選取左側訊號** (`axis_in...`, `s_axi...`) -> 在 **Side/Edge** 選 **Left** -> 在 **Layer** 選 **metal3**。
    - **特別注意**：選到 `s_axi_aclk` 時，請在下方的 **Use** 選單中選擇 **CLOCK**。
    - **關於 Clock Pin**：放在 Metal 3 是**完全沒問題**的。雖然時脈訊號在晶片內部通常會走高層金屬 (如 M7/M8) 以減少延遲，但 **Pin (入口)** 設在 M3 可以方便外部連接。Innovus 的 CTS (Clock Tree Synthesis) 會自動幫你把訊號從 M3 拉到高層去走，不用擔心。
2.  **選取右側訊號** (`class...`) -> 在 **Side/Edge** 選 **Right** -> 在 **Layer** 選 **metal3**。
3.  **選取 VDD** -> 在 **Side/Edge** 選 **Top** -> 在 **Layer** 選 **metal5** (電源用高層一點比較好)。
4.  **選取 VSS** -> 在 **Side/Edge** 選 **Bottom** -> 在 **Layer** 選 **metal5**。

## 4. Metal Layers & Pin Spacing 深度解析

### Metal 數字的意義 (物理意義)
晶片就像一棟大樓，Metal 1 (M1) 是 1 樓，Metal 10 (M10) 是 10 樓。
- **低層金屬 (M1 - M2)**：
    - **特徵**：很細、很擠、電阻大。
    - **用途**：標準元件 (Standard Cell) 內部的連線。
    - **為什麼 Pin 盡量不要放這？** 因為 M1 已經被標準元件塞滿了，如果 Pin 也擠在這裡，會造成「塞車」(Congestion)。
- **中層金屬 (M3 - M6)**：
    - **特徵**：寬度適中，電阻適中。
    - **用途**：模組之間的訊號連線 (Signal Routing)。
    - **為什麼 Pin 放這？** 這是最適合走訊號線的高速公路。
- **高層金屬 (M7 - M10)**：
    - **特徵**：很粗、很厚、電阻超小。
    - **用途**：**電源線 (VDD/VSS)** 和 時脈樹 (Clock Tree)。
    - **為什麼電源要放這？** 因為電源需要大電流，電阻越小越好 (減少 IR Drop)。而且放高層不會擋到下面的訊號線。

### Spacing (間距) 怎麼設？
- **Spacing** 決定了兩個 Pin 之間的距離。
- **不需要**參考 Floorplan 長寬，而是要看**你有多少個 Pin**。
    - 假設你的左邊界長度是 700um。
    - 如果你有 100 根 Pin 要放左邊，那 Spacing 最多只能設 7um (700/100)。
    - 如果你只有 10 根 Pin，那 Spacing 設 20um 甚至 50um 都沒問題。
- **建議設定**：
    - 通常不需要手算。直接在 Pin Editor 選擇 **Spread Type: From Center** (從中間散開) 或 **Fill** (填滿)，Innovus 就會自動幫你算出最適合的間距。
    - 如果一定要手動填，填個 **2um ~ 5um** 通常都很安全。

## 5. Power Planning (電源規劃)

### Global Net Connect (全域電源連接)
在畫 Power Ring 之前，你必須先告訴 Innovus：「誰是電源？誰是地？」
這就是 `globalNetConnect` 指令的作用。

```tcl
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
```

- **物理意義**：
    - 你的標準元件 (Standard Cells) 裡面都有叫做 `VDD` 和 `VSS` 的小接腳 (Pin)。
    - 但是 Innovus 一開始不知道這些接腳要連到哪裡。
    - 這個指令就是說：「嘿！只要你看到任何元件上有叫 `VDD` 的接腳，通通把它連到全域的 `VDD` 電源網路上！」
- **如果沒做這步**：
    - 就算你畫了超粗的 Power Ring，你的標準元件也吃不到電，因為它們之間沒有邏輯上的連接關係。Innovus 會以為那些元件的電源腳是懸空的 (Floating)。
- **Tie High / Tie Low**：
    - `globalNetConnect VDD -type tiehi`
    - `globalNetConnect VSS -type tielo`
    - 這是把邏輯上的「常數 1 (High)」連到 VDD，「常數 0 (Low)」連到 VSS。這對於防止訊號浮接非常重要。

### Add Rings (畫電源環)

這一步要在 Core 的外圍畫一圈電源。

#### 1. Net(s)
- 填入：`VDD VSS` (中間用空白隔開)。

#### 2. Ring Configuration (參數設定)
這裡的設定要跟你的 Pin 配合：

- **Top / Bottom Layer**:
    - **建議**: 選 **Metal 5 (Horizontal)**。
    - **原因**: 因為你的 VDD/VSS Pin 就在 Top/Bottom 且是 M5。選同一層，它們就會直接連在一起，非常完美！
- **Left / Right Layer**:
    - **建議**: 選 **Metal 6 (Vertical)**。
    - **原因**: 為了形成一個網狀結構，垂直邊通常選跟水平邊「正交 (Orthogonal)」的層。如果 Top 是 M5，那 Left/Right 就選 M6 (或 M4)。
- **Width (線寬)**:
    - **建議**: **5** (單位是 um)。
    - **原因**: 你的 Margin 有 50um，非常寬裕。畫 5um 的線很安全，電流也夠。
- **Spacing (線距)**:
    - **建議**: **2**。
    - **原因**: 這是 VDD 和 VSS 兩條線之間的距離，留 2um 避免短路。
- **Offset (偏移量)**:
    - **建議**: **2** (或者跟 Tutorial 填 **0** 也可以)。
    - **意義**: 這是 Ring 距離 Core 邊界的距離。
        - 設 0 代表 Ring 緊貼著 Core。
        - 設 2 代表 Ring 往外退 2um，留一點緩衝區。
        - 因為你有 50um 的 Margin，所以不管設 0 還是 2，Ring 都會乖乖待在 Margin 裡面，不會超出晶片邊界。

#### 3. 預期結果
按下 OK 後，你應該會看到 Core 的周圍出現兩圈粗粗的線，一圈是 VDD，一圈是 VSS。
- 上下邊是藍色的 (假設 M5 是藍色)。
- 左右邊是紅色的 (假設 M6 是紅色)。
- 它們在角落會自動打 Via 連起來，形成一個閉合的環。

### Add Stripes (畫電源條)

#### 1. Ring vs Stripe 的差別
- **Ring (環)**：像護城河一樣，圍繞在 Core 的四周。它是電源的**主要入口**。
- **Stripe (條)**：像棋盤格，橫跨在 Core 的內部。
    - 它的作用是把 Ring 上的電，送到 Core 內部的每一個角落。
    - 想像 Ring 是大水管，Stripe 是分接出來的中水管，最後再連到標準元件的小水管。

#### 2. Set Configuration (參數設定)
- **Net(s)**: `VDD VSS`
- **Layer**: **Metal 6 (Vertical)**
- **Width**: **3** (請填數字，不要留 `pin_width`)。
- **Spacing**: **2** (注意！這是 VDD 跟 VSS **兩條線之間**的距離，不要填 100)。

#### 3. Set Pattern (密度設定)
- **Set-to-set distance**: **100**。
    - **意義**：這是 **「這一組 VDD/VSS」到「下一組 VDD/VSS」** 的距離。這才是決定密度的參數。
    - **圖解**：`|VDD| --2um-- |VSS|  ------ 100um ------  |VDD| --2um-- |VSS|`
- **Start from**: **Left** (因為是畫垂直線，所以從左邊開始畫過來)。

#### 4. 預期結果
按下 OK 後，你會看到 Core 內部出現好幾條垂直的粗線，從上連到下，把電網變得更密。

> **Q: 我看 Tutorial 教學是垂直跟水平都有畫，這樣對嗎？**
> **兩個都對！** 這取決於你的設計策略：
> 1.  **垂直只有 (Vertical Only)**：
>     - **優點**：省資源，留更多空間給訊號線走。
>     - **適用**：大部分的中小型設計，因為標準元件本身就有水平電源線 (M1)，靠垂直 Stripe 供電就夠了。
> 2.  **網狀格 (Mesh Grid - Tutorial 的做法)**：
>     - **優點**：電源更穩 (IR Drop 更小)，因為電可以四通八達地流。
>     - **缺點**：會佔用多一層金屬 (例如 M5) 的走線資源。
>     - **適用**：大型設計、或是對電源雜訊很敏感的設計。
>
> **建議**：既然你在做 Tutorial，**跟著 Tutorial 做 (畫水平 Stripe) 是完全沒問題的！** 這會讓你的電源網更強壯。如果要畫水平 Stripe，記得選 **Metal 5 (Horizontal)**，這樣才能跟垂直的 M6 形成交叉網。

### SRoute (Special Route, 連接電源網格)

畫完了 Ring 和 Stripe，它們現在還只是「浮在空中」的大水管。
我們需要用 `sroute` 指令，把這些大水管往下打 Via，連到標準元件的 **Power Rail (M1)**。

#### 1. 指令或 GUI
- **GUI**: Route -> Special Route
- **Command**: `sroute -connect { blockPin padPin padRing corePin floatingStripe } ...`

#### 2. 關鍵設定 (Basic Tab)
- **Net(s)**: `VDD VSS`
- **Allow Jogging**: 勾選 (允許走線轉彎)。
- **Allow Layer Change**: 勾選 (允許打 Via 換層)。
- **Block pins**: 勾選 (連接 Macro 的 Pin)。
- **Pad pins**: 勾選 (連接 IO Pad 的 Pin)。
- **Pad rings**: 勾選。
- **Core pins**: **一定要勾選！** (這就是連接標準元件的 Power Rail)。
    - Target: **Standard Cell Pins**。
- **Floating stripes**: 勾選 (連接我們剛剛畫的 Stripe)。

#### 3. Tutorial 指令解析 (進階)
你看到的指令其實就是 GUI 所有選項的總合。直接複製貼上是**最快且最保險**的方法。
(我這裡更新成跟你 PDF 一模一樣的版本，包含了一些進階設定)：

```tcl
sroute -connect { blockPin padPin padRing corePin floatingStripe } \
       -layerChangeRange { 1 10 } \
       -blockPinTarget { nearestRingStripe nearestTarget } \
       -padPinPortConnect { allPort oneGeom } \
       -checkAlignedSecondaryPin 1 \
       -blockPin useLef \
       -allowJogging 1 \
       -crossoverViaBottomLayer 1 -crossoverViaTopLayer 10 \
       -allowLayerChange 1 \
       -targetViaTopLayer 10 -targetViaBottomLayer 1 \
       -nets { VDD VSS }
```

- **`-connect { ... }`**: 這是最重要的部分。
- **`-padPinPortConnect { allPort oneGeom }`**: (PDF 多這行) 設定 IO Pad 的連接方式。雖然你是 Block Level 可能用不到，但加了也沒壞處。
- **`-blockPin useLef`**: (PDF 多這行) 告訴工具參考 LEF 檔來連接 Macro Pin。
- **`-layerChangeRange { 1 10 }`**: 允許工具使用 M1 到 M10 所有的金屬層來打 Via。這很安全，讓工具自由發揮。
- **`-allowLayerChange 1`**: 允許換層 (1=True)。
    - **物理意義**：你的 Stripe 在高樓層 (例如 M6)，標準元件在 1 樓 (M1)。如果不允許換層，電就下不去。這個選項就是允許工具**「搭電梯」(打 Via)** 下樓去連接。
- **`-crossoverVia...` & `-targetVia...`**:
    - 這兩組參數都是在設定 **「可以使用哪些層來打 Via」**。
    - `crossover`: 指的是線與線交叉時 (例如 Stripe 跨過 Ring)。
    - `target`: 指的是連到目標 Pin 時 (例如 Stripe 連到 Standard Cell)。
    - **設定 `1` 和 `10` 的意思**：就是開放 **Metal 1 到 Metal 10 全部的樓層** 給工具使用。
    - **關於順序**：指令中 `Bottom` 和 `Top` 的先後順序不影響結果，只要範圍涵蓋 M1-M10 即可。
- **`-nets { VDD VSS }`**: 指定要連接的電源網。

#### 4. 預期結果
執行完後，你會看到畫面上出現密密麻麻的細線或 Via，把 Stripe 和底層的 M1 Rail 連接起來。
這時候，你的電源規劃才算大功告成！

## 6. Placement (擺放元件)

### GUI vs 指令：哪一個比較好？
**強烈建議使用 Tutorial 的指令！**

雖然 GUI 介面 (Place Design) 只有一個簡單的 OK 按鈕，但它背後其實隱藏了很多設定。
Tutorial 的指令幫你把這些設定都「明確地」寫出來了，這樣才能確保你的結果跟 Tutorial 一樣好。

### 指令解析
```tcl
# 1. 補強電源 Via (這步通常在 SRoute 之後做，確保連接更穩固)
# 注意：如果這步產生大量 DRC (如 NSMETAL)，且 verifyConnectivity 沒問題，可以跳過此步。
editPowerVia -skip_via_on_pin Standardcell -bottom_layer metal1 -add_vias 1 -top_layer metal6

### 故障排除：editPowerVia 產生 NSMETAL DRC 怎麼辦？

**Q: 我可以不執行這行嗎？**

**可以！而且通常是最佳解法。**

**為什麼會報錯 (NSMETAL)？**
- **原因**：`editPowerVia` 試圖在交叉點打 Via，但你的金屬線可能太細，或者 Via 打偏了，導致金屬包不住 Via (Enclosure Rule Violation)。

**解決策略 (由簡單到複雜)**：

1. **策略一：直接拿掉指令 (推薦 ✅)**
   - 既然這行是「額外增強」用的，拿掉它通常不會死人。
   - **做法**：不執行這行，直接做下一步。
   - **驗證**：跑 `verifyConnectivity -type special`。
     - 如果 **沒有 Open**：恭喜！那些 Via 本來就是多餘的，拿掉剛好解決 DRC。
     - 如果 **有 Open**：才需要考慮下面的方法。

2. **策略二：手動刪除 Via (快速但有風險)**
   - **做法**：在 GUI 選中報錯的 Via，按 Delete 刪除。
   - **風險**：可能會造成斷路，刪完一定要再跑 Connectivity 檢查。

3. **策略三：補金屬 Patch (正規修法)**
   - **做法**：在 Via 旁邊畫一個小金屬塊 (Patch) 把露出來的 Via 蓋住。
   - **缺點**：費工，且可能造成短路。

**結論**：先試著**不執行這行**，只要 Power 連接沒斷，這就是最乾淨的解法！

### 關鍵觀念：top_layer 的選擇

**Q: `top_layer` 選多少會影響 DRC 嗎？**

**會的！而且打越高，DRC 越難過！**

**關鍵觀念（反直覺）**：
- ❌ **錯誤想法**：「我有 10 層金屬，所以設 metal10 可以讓電源更強，DRC 更容易過。」
- ✅ **正確想法**：「我的 Power Grid 最高只到 M6，所以設 metal6 剛好，不阻擋其他走線。」

**為什麼打高反而更糟？**
1. **Via 是柱子，不是空氣**：
   - `editPowerVia -top_layer metal8` 會從 M1 打一根 Via 柱子到 M8。
   - 這根柱子會**佔用 M2, M3, M4, M5, M6, M7 所有中間層的空間**。
2. **阻擋訊號走線**：
   - M3~M6 是訊號線的主要走線層。如果被電源柱子擋住，訊號線就繞不過去。
   - 結果：**Congestion (擁擠) → Short/Spacing DRC 爆炸**。
3. **無意義的連接**：
   - 如果你的 Power Stripe 最高只在 M6，打 Via 到 M8 只是在接空氣，毫無意義。

**正確策略**：
- 你的 Power Grid (Ring + Stripe) 最高層是什麼，就填那一層。
- 例如：如果你的 Stripe 是 M5 + M6，就填 `-top_layer metal6`。
- **不要**因為製程有 10 層就填 metal10，那是自找麻煩。

# 2. 設定 End Cap (在每一排的頭尾加上保護蓋，這是物理驗證 DRC 的要求)
setEndCapMode -reset
setEndCapMode -boundary_tap false

# 3. 設定 Placement 模式 (這是最關鍵的一步！)
setPlaceMode -congEffort auto \
             -timingDriven 1 \
             -modulePlan 1 \
             -clkGateAware 1 \
             -powerDriven 0 \
             -ignoreScan 1 \
             -reorderScan 1 \
             -placeIOPins 0 \
             -fp false

# -timingDriven 1: 告訴工具要努力滿足時序要求 (Timing Constraints)。
# -clkGateAware 1: 考慮 Clock Gating 對擺放的影響 (省電)。
# -reorderScan 1: 允許工具重新排列 Scan Chain 以減少走線擁擠。
# -fp false: 關閉 Floorplan Mode。這很重要！確保我們是在做詳細擺放 (Detailed Placement) 而不是粗略規劃。

# 4. 開始擺放！
placeDesign
```

**結論**：
如果你只按 GUI 的 OK，你可能只是跑了一個「預設模式」的 Placement，它可能沒有開 Timing Driven，也沒有做 Scan Reordering。
所以，**請直接複製貼上 Tutorial 的這一整段指令**，這是最專業的做法。

### Post-Placement 檢查 (Placement 完成後要做的事)

Placement 完成後，**不要**馬上做 DRC 檢查（那是 Routing 後的事）。
你應該先檢查以下幾點，確認 Placement 的品質：

#### 1. Congestion Map (擁擠度地圖) - **最重要！**
**這是決定你後續 Routing 能否成功的關鍵。**

**指令**:
```tcl
checkPlace
```

**GUI**: Analyze -> Check Placement -> Congestion

**如何看結果**:
- Innovus 會顯示一張熱力圖，顏色代表擁擠程度：
  - **綠色**：很空，走線資源充足。
  - **黃色**：微微擁擠，還可以接受。
  - **紅色**：非常擁擠，訊號線可能繞不過去。
- **合格標準**：
  - 如果大部分區域是綠色或淺黃色，恭喜你，可以繼續下一步。
  - 如果出現大片紅色區域，代表這裡的 Placement 太密了，後續 Routing 會失敗。

**如果有紅色怎麼辦**？
1. 降低 Utilization (例如從 0.6 降到 0.55)，重新 Floorplan + Placement。
2. 檢查是不是 Power Stripe 畫得太密，擋住太多走線空間。

> **Q: Congestion Map 上的數字 (例如 84/80) 是什麼意思？**
> 
> 這些數字代表該區域的**走線資源供需比**：
> - **80** (分母)：該區域可用的走線軌道數 (Routing Tracks)。
>   - 每個 Metal Layer 上有固定數量的軌道（像公路的車道）。
>   - 例如：該區域在 M3 層有 40 條軌道，M4 層有 40 條，總共 80 條。
> - **84** (分子)：placeDesign 預估需要的走線數量。
>   - 工具根據元件之間的連接關係，估算需要 84 條線才能把所有東西接起來。
> - **84/80 > 1**：代表**需求超過供給**，這個區域會擁擠（紅色或黃色）。
> - **60/80 < 1**：代表供給充足（綠色或藍色）。
> 
> **placeDesign 會走線嗎？**
> - **不會**！placeDesign 只是「擺放元件」，不會真正走線。
> - 但它會做 **Trial Routing (試走線)** 或 **Global Routing Estimation (全域走線估算)**。
>   - 想像工具在腦海中模擬：「如果我要連這些元件，大概需要走多少條線？」
>   - 這個估算的結果就是分子 (84)。
> - 真正的走線是在 **routeDesign** 階段才做。
> 
> **為什麼這很重要？**
> - 如果 Congestion Map 顯示很多紅色區域，代表 placeDesign 預測「即使我拼命走線，也走不過去」。
> - 這時候你需要降低 Utilization 或調整 Floorplan，而不是硬著頭皮進 Routing（會失敗的）。

#### 2. Timing Report (時序報告)
雖然還沒做 CTS 和 Routing，但可以先看一下 Placement 後的初步時序。

**指令**:
```tcl
timeDesign -preCTS
```

**如何解讀報告？**

報告分成幾個部分：

**1. Setup Timing (建立時間)**
```
+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  2.047  |  2.047  |  3.833  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
```

- **WNS (Worst Negative Slack)**：最差的時序鬆弛度
  - **正數**：代表時序健康，還有餘裕。例如 `2.047 ns` 代表最差的路徑還有 2ns 的安全餘量。
  - **負數**：代表時序違規，訊號太慢到達。例如 `-0.5 ns` 代表差了 0.5ns。
- **TNS (Total Negative Slack)**：所有違規路徑的鬆弛度總和
  - `0.000` 代表沒有任何違規。
- **Violating Paths**：違規路徑數量
  - `0` 代表完美！

**2. DRVs (Design Rule Violations - 設計規則違規)**
```
+----------------+------------------+------------+------------------+
|   max_cap      |   3561 (3561)    |   -1.233   |   3562 (3562)    |
|   max_tran     |  46780 (316212)  |   -2.947   |  47154 (321886)  |
|   max_fanout   |   2574 (2574)    |    -471    |   2575 (2575)    |
```

- **max_cap (最大電容)**：有 3561 個網路的電容超標。
- **max_tran (最大轉換時間)**：有 46780 個網路的訊號轉換時間太慢。
- **max_fanout (最大扇出)**：有 2574 個網路驅動太多 Gate。

**注意**：這些**不是 DRC**（那是 Routing 後的物理走線違規）。
這些是**電氣特性違規**，代表訊號品質不佳，但可以透過 `optDesign` 修復（插入 Buffer、調整 Gate Size）。

**3. Routing Overflow (走線溢出預估)**
```
Routing Overflow: 0.20% H and 0.99% V
```
- 這是工具預估的走線擁擠度。
- `< 5%` 通常代表健康。
- 你的 `0.20% H, 0.99% V` 非常優秀！

**結果判讀**：
- ✅ **WNS = 2.047 > 0**：時序非常健康！
- ⚠️ **DRVs 很多**：但這很正常，`optDesign` 會修復。
- ✅ **Routing Overflow < 1%**：走線空間充足。

**下一步**：執行 `optDesign -preCTS` 來修復 DRVs。

**optDesign 結果解讀**

執行 `optDesign -preCTS -numPaths 200` 後，會看到類似的報告：

```
+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  5.234  |  6.116  |  5.234  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
+--------------------+---------+---------+---------+

+----------------+------------------+------------+------------------+
|   max_cap      |     18 (18)      |   -0.010   |     19 (19)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |    970 (970)     |    -19     |    971 (971)     |
+----------------+------------------+------------+------------------+

Density: 66.003%
Routing Overflow: 0.50% H and 0.83% V
```

**對比優化前後：**

| 項目 | 優化前 (timeDesign) | 優化後 (optDesign) | 改善 |
|------|---------------------|---------------------|------|
| WNS | 2.047 ns | 5.234 ns | ✅ +3.2 ns (更好) |
| max_cap 違規數 | 3,561 | 18 | ✅ 減少 99.5% |
| max_tran 違規數 | 46,780 | 0 | ✅ 完全修復 |
| max_fanout 違規數 | 2,574 | 970 | ✅ 減少 62% |
| Density | 58.38% | 66.00% | ⚠️ 增加 (因為插入 Buffer) |
| Routing Overflow | 0.20%/0.99% | 0.50%/0.83% | ✅ 仍然很低 |

**結論：優化非常成功！**

**需要再 opt 一次嗎？**

**不需要！** 判斷標準：

✅ **可以繼續的條件** (你的狀況)：
- WNS > 0 (你有 5.234 ns，非常健康)
- TNS = 0 (沒有時序違規)
- DRVs 大幅減少 (max_tran = 0, max_cap 只剩 18 個)
- Routing Overflow < 5% (你只有 0.5%/0.83%)

❌ **需要重新 opt 的條件**：
- WNS < 0 (出現負的 Slack)
- Routing Overflow > 10% (走線空間嚴重不足)
- Density > 90% (太擠了，Routing 會失敗)

**DRVs vs DRC 的區別**

> **重要觀念**：這裡的 DRVs **不是** DRC Violation！
> 
> - **DRVs (Design Rule Violations)**：
>   - 電氣特性違規 (訊號品質問題)
>   - 發生在 Placement/Optimization 階段
>   - 透過插入 Buffer、調整 Gate Size 來修復
>   - 例如：max_cap, max_tran, max_fanout
> 
> - **DRC (Design Rule Check)**：
>   - 物理走線違規 (金屬線太近、太窄等)
>   - 發生在 Routing 階段
>   - 要透過調整走線路徑來修復
>   - 例如：Short (短路), Spacing (間距), Width (線寬)
> 
> **所以，這裡的 DRVs 修復了，不代表後續 Routing 不會有 DRC。**
> 但是，你的 Routing Overflow 很低 (< 1%)，代表後續 DRC 的風險非常小。

**下一步**

你現在可以：
1. **存檔**：`saveDesign preCTS_opt.enc`
2. **繼續往下走**：進入 CTS (Clock Tree Synthesis)
3. 或者執行 `setDrawView place` 更新視圖，看看新插入的 Buffer

### DRC 檢查的正確時機

> **Q: 我在 Placement 後跑 DRC，出現很多 violation，這正常嗎？**
> 
> **非常正常！而且現階段不應該跑完整的 DRC。**

**為什麼會有很多 DRC violation？**

1. **還沒 Routing (走線)**：
   - 現在你只有 Power Grid 和 Placement，還沒有訊號線的實體走線。
   - 所有的 Signal Net 都是斷開的 (Open)。
   - verifyGeometry 看到的可能只是「試走線 (Trial Route)」的預估，不是真實的金屬線。

2. **Short (短路) 的誤報**：
   - 工具看到預估的線疊在一起，或者 Power Line 碰到還沒繞好的 Signal Pin，就報 Short。
   - 但這不是真的短路，等你跑完 `routeDesign`，Router 會自動避開障礙，這些 Short 就會消失。

**這個階段該檢查什麼？**

**只需要檢查 Placement Legality (擺放合法性)，不需要看 Geometry DRC。**

**指令**：
```tcl
checkPlace
```

**如何判讀結果**：

看 Summary 的最後幾行：
```
Cells       : 0
  Overlap     : 0
Short       : 1000  <- 這個可以忽略
```

- **Cells = 0**：沒有 Standard Cell 違規 ✅
- **Overlap = 0**：沒有 Cell 重疊 ✅
- **Short = 1000**：可以忽略 ⚠️（因為還沒 Routing）

**判斷標準**：
- ✅ **Cells = 0 且 Overlap = 0** → Placement 成功，可以繼續！
- ❌ **Cells > 0 或 Overlap > 0** → 必須修掉（可能是 Floorplan 太擠）

**使用 Violation Browser 區分錯誤類型**

在 GUI：**Tools → Violation Browser**

- **Placement 類別**（必須修）：
  - Cell Overlap
  - Cell Orientation
  - Tech Site
- **Geometry 類別**（可忽略）：
  - Metal Spacing
  - Short
  - Cut Spacing

**完整的 DRC 檢查應該在 `routeDesign` 之後！**

那時候才會有真實的金屬走線，才適合跑 Sign-off 等級的 DRC (如 Calibre)。


#### 3. 視覺檢查
**指令**: 在 GUI 上縮小看整個晶片。

**檢查點**:
- 標準元件是否均勻分布？還是某些區域特別空、某些特別擠？
- 有沒有明顯的空洞 (Hole)？這可能代表 Floorplan 規劃有問題。

#### 4. 下一步
如果 Congestion Map 看起來健康（大部分綠色或淺黃色），你就可以進入下一階段：
- **CTS (Clock Tree Synthesis)**: 建立時脈樹。
- 或者先做 **Pre-CTS Optimization**: 優化 Placement 以改善時序。

## 7. CTS (Clock Tree Synthesis, 時脈樹建立)

### 0. 前置觀念 (Pre-CTS Check)

在按下 CTS 按鈕前，請先確認你的設計狀態。

**Place 後的 DRC 很多正常嗎？**
- **正常**。`verifyGeometry` 報的 Short/Open 大多是因為還沒繞線 (Trial Route) 造成的虛擬錯誤。

**該檢查什麼？**
- `checkPlace`：必須 0 Violation (Cell 不能重疊)。
- **Congestion**：擁塞度 (Overflow) 最好在 1% 以下。
- `verifyConnectivity -type special`：PG (電源/地) 必須接好。

### 1. 什麼是 NDR (Non-Default Rule)？

Clock 是晶片的心臟，為了跑得快 (低電阻) 且抗干擾 (低 Crosstalk)，我們不使用預設的最細線寬，而是制定特殊規則。

- **2W (兩倍寬)**：降低電阻。數值是基於 LEF 檔中該層的 WIDTH × 2。
- **2S (兩倍距) / 1S (一倍距)**：避免干擾。數值是基於 LEF 檔 SPACINGTABLE 左上角的最小值。

**設定步驟 (GUI 介面)**：

1. 打開 **Edit → Create Non Default Rules** (或類似選單)。
2. **Name**: 輸入 `CTS_2W1S` (或其他名字)。
3. **Width**: 手動將每一層的數值改成原來的 **2 倍**。
4. **Spacing**:
   - 如果是 1S (Leaf 用)：保持原數值不動。
   - 如果是 2S (Trunk 用)：手動改成 **2 倍**。
5. **Via**: 留空 (讓 Tool 自動選)。

### 2. Leaf vs. Trunk (樹枝與樹幹)

CTS 的結構分為兩大部分，需分別設定不同的走線策略。

|  | **Leaf (樹枝)** | **Trunk (主幹)** |
|---|---|---|
| **定義** | 最後一顆 Buffer → Flip-Flop (M1) | Clock Source → 最後一顆 Buffer |
| **特性** | 線短、密度高、要鑽進 Standard Cell | 線長、跨越晶片、怕干擾 |
| **建議層** | M1 ~ M4 (貼近底層方便連線) | M7 ~ M10 (高層高速公路，避開 Power) |
| **規則** | 2W1S (稍微粗一點，間距普通) | 2W2S + Shield (最粗、有護盾) |

### 3. 最佳化指令配置 (Best Practice Script)

這組設定能確保 DRC 容易過，且訊號品質最好。

#### Step 1: 載入/定義 NDR
(假設你已經在 GUI 設好，或用指令定義了 `CTS_2W1S` 和 `CTS_2W2S`)

#### Step 2: 設定 Route Type (關鍵！)

```tcl
# ==========================================
# 1. Leaf Rule (樹枝設定)
# ==========================================
# 策略：放寬到底層 Metal 1，方便 Tool 直接連進 Flip-Flop
# 規則：用 2倍寬、1倍距 (省空間)
create_route_type -name leaf_rule \
  -non_default_rule CTS_2W1S \
  -top_preferred_layer metal4 \
  -bottom_preferred_layer metal1

# ==========================================
# 2. Trunk Rule (主幹設定)
# ==========================================
# 策略：飛到 Metal 7 ~ 10 的高空，避開 M5/M6 的 Power Routing
# 規則：用 2倍寬、2倍距，並且加上 VSS 護盾 (Shielding)
create_route_type -name trunk_rule \
  -non_default_rule CTS_2W2S \
  -top_preferred_layer metal10 \
  -bottom_preferred_layer metal7 \
  -shield_net VSS \
  -bottom_shield_layer metal7
```

#### Step 3: 套用設定並執行

```tcl
# 告訴 CCOpt 引擎使用上述規則
set_ccopt_property route_type -net_type trunk trunk_rule
set_ccopt_property route_type -net_type leaf  leaf_rule

# 自動產生 Spec (抓 Clock root)
create_ccopt_clock_tree_spec

# 開始跑 CTS
ccopt_design
```

### 4. 常見疑惑解答 (Q&A)

> **Q: 為什麼要分 Top/Bottom Layers？**
> 
> A: 因為金屬層有分直走和橫走。給定一個範圍 (例如 M1~M4)，Tool 才能利用 Via 在直橫之間切換，順利把線連起來。

> **Q: 我的 Clock Pin 在 M3，Trunk 設在 M7~M10 會斷掉嗎？**
> 
> A: 不會。Tool 會自動打一串 Via (M3→M4→...→M7) 把訊號送上去。

> **Q: Leaf 設在 M3 會不會跟我的 Pin 打架？**
> 
> A: 會佔用空間，但 Tool 會自動繞道 (Detour) 或打 Via 避開。為了更好繞，建議 Leaf 開放 M1~M4。

> **Q: Shielding (-shield_net) 是做什麼的？**
> 
> A: 在 Clock 線兩旁加上 VSS 地線作為「護衛」，吸收雜訊干擾。

> **Q: 為什麼要把 Trunk 移到 M7~M10？**
> 
> A: 因為你的 Power Routing 佔據了 M5/M6。如果不移走，Clock 擠不進去會爆 DRC；移到 M7~M10 既空曠電阻又小，是最佳解。

### 5. 執行 CTS 的標準黃金腳本 (The Golden Script)

這是經過討論修正後，最完整、最正確的指令順序。包含設定走線規則、套用規則、產生藍圖、到正式執行。

```tcl
# -----------------------------------------------------------
# Step 1: 創造走線規則 (施工規範)
# -----------------------------------------------------------
# Leaf: 為了方便連進 Cell (M1)，放寬範圍至 M1~M4，使用 2W1S
create_route_type -name leaf_rule  -non_default_rule CTS_2W1S \
   -top_preferred_layer metal4  -bottom_preferred_layer metal1

# Trunk: 為了避開 Power (M5/M6)，走高層 M7~M10，使用 2W2S + VSS Shield
create_route_type -name trunk_rule -non_default_rule CTS_2W2S \
   -top_preferred_layer metal10 -bottom_preferred_layer metal7 \
   -shield_net VSS -bottom_shield_layer metal7

# -----------------------------------------------------------
# Step 2: 套用規則 (分派任務)
# -----------------------------------------------------------
# 注意語法：set_ccopt_property <屬性名> -net_type <對象> <值>
set_ccopt_property route_type -net_type leaf  leaf_rule
set_ccopt_property route_type -net_type trunk trunk_rule

# -----------------------------------------------------------
# Step 3: 產生藍圖 (Blueprint)
# -----------------------------------------------------------
# 分析 SDC 與 Netlist，找出 Clock Root 和 Sinks
create_ccopt_clock_tree_spec

# -----------------------------------------------------------
# Step 4: 正式開工 (Run)
# -----------------------------------------------------------
# 同時執行長樹 (CTS) 與 時序優化 (Optimization)
ccopt_design
```

### 6. 語法陷阱與檢查 (Troubleshooting)

在 Step 2 套用屬性時，非常容易寫錯，且 Tool 不一定會報錯。

**❌ 常見錯誤寫法**

```tcl
set_ccopt_property -net_type leaf -route_type leaf_rule
```

**結果**：Tool 以為你要自創一個叫 `-route_type` 的標籤，雖然指令成功，但**完全無效**。

**✅ 正確寫法**

```tcl
set_ccopt_property route_type -net_type leaf leaf_rule
```

**關鍵**：`route_type` 是屬性名稱，不要加 dash (-)。

**🔍 如何檢查有沒有設對？**

如果不確定自己剛剛是不是打錯了，可以用 `get` 指令來驗證：

```tcl
get_ccopt_property route_type -net_type leaf
# 預期回傳: leaf_rule (代表設定成功)
```

### 7. 關鍵步驟解析：為什麼要分兩步跑？

**步驟 A: `create_ccopt_clock_tree_spec`**

- **比喻**：建築師畫藍圖。
- **功能**：還不動手改電路，只是去讀 SDC，確認 Clock 是誰 (`s_axi_aclk`)，以及要接去哪裡 (Flip-Flops)。
- **Log 判讀重點**：
  必須看到類似以下的訊息，才算成功：
  ```
  clock_tree s_axi_aclk contains 8390 sinks and 0 clock gates.
  ```
  **含義**：抓到 Clock 名稱了，且找到了 8390 個負載點。

**步驟 B: `ccopt_design`**

- **比喻**：營造商進場施工。
- **功能**：實際插入 Buffer、Inverter，並依照你設定的 M7~M10 規則進行繞線與優化。

### 8. 指令選擇：-cts 加不加？

在最後一步執行時，你會有兩個選擇：

|  | `ccopt_design` (推薦) | `ccopt_design -cts` (不推薦) |
|---|---|---|
| **功能** | 全配餐 | 簡配餐 |
| **內容** | 長 Clock Tree + Timing Optimization (修 Setup/Hold/DRV) | 只負責把 Clock Tree 長通，把 Skew 做平 |
| **適用時機** | 絕大多數情況 (Default Flow) | 僅用於 Debug 或特殊分階段流程 |
| **優勢** | CCOpt 會利用 Useful Skew 自動幫你修 Timing | 跑比較快，但 Timing 可能很糟 |

**結論**：請直接執行 `ccopt_design` 即可。

### 9. Post-CTS 檢查與下一步

當 `ccopt_design` 跑完（出現提示符號）後，代表 CTS 階段結束。

**檢查 Timing**：

```tcl
timeDesign -postCTS
timeDesign -postCTS -hold
```

**存檔 (非常重要)**：

因為 CTS 改動很大，跑完建議存一個 Design Database。

```tcl
saveDesign cts_done.enc
```

**往下一步邁進**：

進入 `routeDesign` (詳細繞線)。

### 10. Post-CTS 報告解讀與優化

當 `ccopt_design` 跑完後，必須檢查時序與物理規則。

**檢查指令**：

```tcl
timeDesign -postCTS        # 檢查 Setup 和 DRV
timeDesign -postCTS -hold  # 檢查 Hold
```

**報告解讀**：

| 指標 | 範例數值 | 判讀 / 狀態 |
|------|----------|------------|
| **Setup WNS** | +5.176 ns | ✅ PASS (完美)。正值代表餘裕很多，訊號跑得很快。 |
| **Hold WNS** | -0.130 ns | ⚠️ FAIL (正常)。負值代表跑太快，這是 CTS 階段常態，後面 `optDesign` 會插 Buffer 修復。 |
| **Max Fanout** | 964 (Violations) | ❌ CRITICAL FAIL (危險)。代表有一堆線推動過多負載。**絕對不能帶著這個去 Routing**。 |

### 11. 關於 Max Fanout 的重要觀念

> **Q: Routing (繞線) 會自動修 Fanout 嗎？**
> 
> **答案：不會，而且會更慘。**
> 
> - **原因**：Router 的工作只是「把線連起來」。如果 Fanout 爆了 (例如 1 推 50)，Router 會畫出一條超長、電容超大的線。
> - **後果**：訊號推不動 (Slew 變爛)、產生電遷移 (EM) 燒斷線、產生更多時序違規。
> - **結論**：必須在 `optDesign` 階段透過「插 Buffer」來切斷負載。

### 12. 故障排除實錄：由 964 個違規變 0 個

如果遇到 `optDesign` 修不掉 Fanout 的問題，以下是診斷與解決流程。

#### 步驟 A: 診斷原因

**查看違規細節**：

```tcl
report_constraint -drv_violation_type max_fanout -all_violators
```

**可能發現**：
- 違規值約 25~26
- 但限制值 (Limit) 竟然是 20
- **結論**：SDC 中的 `set_max_fanout 20` 設定**太嚴格** (一般可設 30~40)

#### 步驟 B: 互動式修改 SDC (不需重跑流程)

**這是最關鍵的技巧**。不用重新 `init_design`，直接修改記憶體中的約束。

```tcl
# 1. 開啟編輯權限 (告訴 Tool 我要改所有模式的 SDC)
set_interactive_constraint_modes [all_constraint_modes]

# 2. 放寬 Fanout 限制 (從 20 改為 40)
set_max_fanout 40 [current_design]
```

#### 步驟 C: 強制修復 (Force Fix)

修改規則後，命令 Tool 重新優化。

```tcl
# 1. 開啟強制修復模式 (不管是不是 Reset/Clock 都要修)
setOptMode -fixFanoutLoad true

# 2. 專注修 DRV (Max Fanout / Max Cap)
optDesign -postCTS -drv
```

#### 最終成果

經過上述修正後，報告應該顯示：
- **Max Fanout**: 0 ✅ (PASS)
- **Setup**: +5.124 ns ✅ (PASS)

**下一步：進入 Routing (奈米繞線)**

現在設計已經乾淨，可以進行最後的繞線。

```tcl
# 1. 存檔 (必做！現在狀態最好)
saveDesign postCTS_ready_to_route.enc

# 2. 開始繞線
routeDesign

# 3. 繞線後再次存檔
# 3. 繞線後再次存檔
saveDesign routed.enc
```

### 13. Pre-Route: 加入 Standard Cell Filler (標準單元填充)

**⚠️ 觀念修正：Filler 分兩種，不要搞混！**

在 APR 流程中，"Filler" 主要分成兩種。它們的功能、加入時間點完全不同。

#### 1. Standard Cell Filler (標準單元填充) - **這次的主角**
- **功能**：延續 N-Well/P-Sub，連接 M1 Power Rail，告訴 Router 「這裡 M1 有人了」。
- **指令**：`addFiller`
- **加入時間點**：**必須在 `routeDesign` (繞線) 之前！** (Post-CTS Opt 之後)
- **口訣**：先填坑，再鋪路。

**執行指令**：
```tcl
# 務必包含從大到小所有尺寸，確保連 0.19 的洞都填滿
# Cell 名稱請根據你的 LEF 檔修改 (例如 FILL64, FILL32...)
addFiller -cell {FILLCELL_X8 FILLCELL_X4 FILLCELL_X2 FILLCELL_X1} -prefix FILLER
```

#### 2. Metal Filler (金屬填充)
- **功能**：補金屬密度 (Density)，滿足晶圓廠要求。
- **指令**：`addMetalFill`
- **加入時間點**：**流程的最後一步** (Sign-off 前)。

### 14. 繞線階段 (Routing Phase)

**⚠️ 重要警告**

1. **絕對不要** 設定 `-routeWithTimingDriven false`。
   - **原因**：這會叫 Router 無視時序亂繞，導致你之前辛苦修好的 Setup/Fanout 全部毀滅。

**✅ 正確繞線指令**

Innovus 指令對大小寫敏感 (CamelCase)，可加入 `-globalDetail` 參數確保繞線品質。

```tcl
# 1. 存檔 (Post-CTS 狀態)
saveDesign postCTS_ready_to_route.enc

# 2. 執行繞線 (Timing-Driven 是預設值)
routeDesign -globalDetail

# 3. 存檔 (Routed 狀態)
saveDesign routed.enc
```

### 15. 繞線後檢查 (Post-Route Verification)

繞線完成後，真實的線路延遲 (RC Delay) 與干擾 (SI) 出現，需檢查物理與時序狀態。

**物理檢查**

```tcl
# 檢查斷路 (必須是 0)
verifyConnectivity -type all -error 1000 -warning 50

# 檢查短路/幾何錯誤 (DRC)
verify_drc
```

> **實戰經驗**：如果跑出來只有個位數 (如 8 個) 的 DRC Violations，這是非常好的結果，不需要手動修，留給優化步驟自動處理。

**時序檢查**

```tcl
timeDesign -postRoute
```

### 16. 故障排除：修復 Pin 腳位 "Out Of Die" 邊界違規

這是一個非常經典且棘手的 DRC 問題，通常發生在 Routing 之後。

#### 1. 問題現象 (Symptom)
- **錯誤訊息**：`Violation Type: Out Of Die`
- **位置特徵**：座標出現**負值** (例如 x = -0.035)。
- **發生對象**：通常發生在 Clock Input Pin (如 `s_axi_aclk`) 或其他位於晶片邊緣的 IO Pin。
- **無效嘗試**：即使刪除線路並執行 `ecoRoute`，Router 補回去的線依然會超出邊界，無限鬼打牆。

#### 2. 核心原因 (Root Cause)
為什麼線會凸出去？
1. **中心點邏輯**：Innovus 的 Pin 座標是指「幾何中心點」。
2. **金屬寬度**：繞線的金屬是有「寬度 (Width)」的。
3. **案發經過**：
   - Pin 被放置在晶片的最邊緣 (例如 x = 0.000)。
   - Router 嘗試連線時，會對準 Pin 的中心點畫線。
   - 假設線寬是 0.07um，一半的寬度 (0.035um) 就會凸出晶片邊界 (變成 -0.035)。
   - 這導致了 DRC 違規。

> **比喻**：就像貼圓形貼紙，如果你把圓心對準紙張邊緣貼下去，貼紙的一半一定會超出紙張範圍。

#### 3. 解決方案 (Solution)

唯一解法是「**移動 Pin 的物理位置**」，將其稍往晶片內部移動，為金屬線寬預留空間。

**步驟 A：修改 Pin 座標**
1. **選取 Pin**：
   - 在右側面板 Selection Browser 中，只勾選 Term (Terminal/Pin)。
   - 在 Layout 上點選違規的 Pin (如 `s_axi_aclk`)。
2. **查詢屬性 (Query)**：
   - 按鍵盤 `q`。
   - 找到 Location (或 Origin) 欄位。
3. **修改座標**：
   - 將 X 或 Y 座標往內部增加一點數值。
   - **建議數值**：至少大於線寬的一半。通常移動 **0.2um ~ 0.5um** 就非常安全。
   - 例：`0.000` -> `0.200`。

**步驟 B：重繞該訊號線**
1. **刪除舊線**：
   - 選取那條凸出去的爛線 (Wire)，按 Delete 刪除。
2. **自動重繞**：
   - 執行指令：
     ```tcl
     ecoRoute
     ```
3. **結果驗證**：
   - 因為目標點 (Pin) 已經在內部了，Router 自然會把線畫在安全範圍內。
   - 執行 `verify_drc` 確認 Out Of Die 消失。

#### 4. 關鍵心得 (Key Takeaway)
- **ecoRoute 不是萬能的**：它只負責連線，不負責改 Pin 的位置。如果 Pin 本身位置不合法（太靠邊），怎麼繞都會錯。
- **物理邊界意識**：在做 Floorplan 或置放 IO Pin 時，必須預留 Routing Margin (繞線邊際)，不要把 Pin 設在死板的 0.0 座標上。

### 17. 繞線後優化 (Post-Route Optimization)

這是設計流程中最關鍵的最後一哩路。它會同時修復 Setup, Hold, Crosstalk (SI)，並順便嘗試解掉殘留的 DRC。

```tcl
# 1. 設定分析模式 (開啟 OCV 變異分析與 CPPR，符合 Sign-off 標準)
setAnalysisMode -analysisType onChipVariation -cppr both

# 2. 執行優化
optDesign -postRoute
```

### 18. 最終收尾流程 (Finalizing)

跑完 `optDesign` 後的標準收尾 SOP。

#### Step A: 解決頑固 DRC

如果優化後 `verify_drc` 還有殘留錯誤 (Short/Spacing)，使用 "手術刀" 指令：

```tcl
# 強制局部重繞來解 DRC
ecoRoute -fix_drc
```

#### Step B: 加入 Metal Filler (金屬填充)

這是全流程的最後一步。**確定 Timing PASS 且 DRC Clean 後才做**。

```tcl
# 補金屬密度 (Density)
addMetalFill
```

#### Step C: 最終存檔 (Tape-out Ready)

```tcl
saveDesign final_finished.enc
```

### 19. 總結：正確的順序 (SOP)

1. `addFiller` (Standard Cell Filler, 先填坑)
2. `routeDesign` (繞線, 再鋪路)
3. `verify_drc` (檢查)
4. `optDesign -postRoute` (修時序 + 修 DRC)
5. `ecoRoute -fix_drc` (補刀)
6. `addMetalFill` (最後補金屬密度)



