#=============================================================================
# run-opt.tcl 
#=============================================================================
# @brief: A Tcl script for the optimization experiments from lab 1 section 4.3
#
# @desc: Fix the design configuration to use 20 iterations and 32-bit signed
# fixed-point type with 8 integer bits. The goal is to maximize the throughput
# of this design using optimization directives provided by Vivado HLS. 
#

# Your Vivado HLS project script goes here
# HINT: You can use run_fixed.tcl as a template. Then, run this script with
# `vivado_hls -f run_opt.tcl`

#------------------------------------------------------
# Set result filename and clean old data
#------------------------------------------------------

# To use for batch tests
set filename "opt_result.csv"
file delete -force "./result/${filename}"

#------------------------------------------------------
# Synthesis process
#------------------------------------------------------

proc do_synth {proj_name unroll_f pipeline_i} {
  global filename

  # Define the bitwidth macros from CFLAGs (use default bit-widths)
  set CFLAGS "-DFIXED_TYPE -DFULL_WIDTH=32 -DI_WIDTH=8"

  # Open/reset the project
  open_project ${proj_name} -reset
  # Top function of the design is "cordic"
  set_top cordic

  # Add design and testbench files
  add_files cordic.cpp -cflags $CFLAGS
  add_files -tb cordic_test.cpp -cflags $CFLAGS

  open_solution "solution1"
  # Use Zynq device
  set_part {xc7z020clg484-1}

  # Target clock period is 10ns
  create_clock -period 10

  # Simulate the C++ design
  csim_design

  if {$unroll_f != 0} {
    set_directive_unroll -factor $unroll_f cordic/FIXED_STEP_LOOP
  }
  if {$pipeline_i != 0} {
    set_directive_pipeline -II $pipeline_i cordic/FIXED_STEP_LOOP
  }

  # Synthesize the design
  csynth_design

  # We will skip C-RTL cosimulation for now
  #cosim_design

  #---------------------------------------------
  # Collect & dump out results from HLS reports
  #---------------------------------------------
  set argv [list $filename $proj_name]
  set argc 2
  source "./script/collect_result.tcl"
}

#-----------------------------------
# run batch experiments
#-----------------------------------

# Unrolling tests
for {set f 0} {$f < 21} {incr f} {
  do_synth "opt_unroll_${f}.prj" $f 0
}

# Pipelining tests
for {set i 1} {$i < 41} {incr i} {
  do_synth "opt_pipeline_${i}.prj" 0 $i
}

do_synth "opt_best.prj" 20 1

quit