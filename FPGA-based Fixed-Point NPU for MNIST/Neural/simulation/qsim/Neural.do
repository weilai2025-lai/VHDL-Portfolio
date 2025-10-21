onerror {exit -code 1}
vlib work
vcom -work work Neural.vho
vcom -work work Waveform18.vwf.vht
vsim -novopt -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Sig_ROM_vhd_vec_tst
vcd file -direction Neural.msim.vcd
vcd add -internal Sig_ROM_vhd_vec_tst/*
vcd add -internal Sig_ROM_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
