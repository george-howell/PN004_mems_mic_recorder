# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.cache/wt [current_project]
set_property parent.project_path Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/biquad.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/cicFilter.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/cicFirDemod.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/cicFlt.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/clocks.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/dataTransmit.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/fifoRead.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/fifoWrite.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/firFlt.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/hpFlt.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/pdmDecode.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/pdmDemod.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/spiSlave.vhd
  Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/memsMicRec_top.vhd
}
read_ip -quiet Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.srcs/sources_1/ip/mmcm_clock/mmcm_clock.xci
set_property used_in_implementation false [get_files -all z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.srcs/sources_1/ip/mmcm_clock/mmcm_clock_board.xdc]
set_property used_in_implementation false [get_files -all z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.srcs/sources_1/ip/mmcm_clock/mmcm_clock.xdc]
set_property used_in_implementation false [get_files -all z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/memsMicRec_vivado/memsMicRec_vivado.srcs/sources_1/ip/mmcm_clock/mmcm_clock_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/Basys3_Master.xdc
set_property used_in_implementation false [get_files Z:/Documents/DOCS/projects/projects_uploaded/PN004_mems_mic_recorder/fpga_project_copy/code/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top memsMicRec_top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef memsMicRec_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file memsMicRec_top_utilization_synth.rpt -pb memsMicRec_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]