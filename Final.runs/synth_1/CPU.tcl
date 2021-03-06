# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.cache/wt} [current_project]
set_property parent.project_path {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/BoisseGibson CMPEN 331 Final Project/Final/Final.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/ALU.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/CntrlUnit.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/DataMem.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/EXE_MEM.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/ID_EXE.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/IF_ID.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/IncrPC.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/MEM_WB.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/PCReg.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/REGFile.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/instructionMemory.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/signExt.v}
  {D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/sources_1/imports/new/CPU.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/constrs_1/imports/imports/ZYBO_MASTER.xdc}}
set_property used_in_implementation false [get_files {{D:/BoisseGibson CMPEN 331 Final Project/Final/Final.srcs/constrs_1/imports/imports/ZYBO_MASTER.xdc}}]


synth_design -top CPU -part xc7z010clg400-1


write_checkpoint -force -noxdef CPU.dcp

catch { report_utilization -file CPU_utilization_synth.rpt -pb CPU_utilization_synth.pb }
