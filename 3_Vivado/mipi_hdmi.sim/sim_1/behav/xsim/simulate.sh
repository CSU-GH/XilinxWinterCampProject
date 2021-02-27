#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Dec 29 13:33:04 CST 2020
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim design_1_wrapper_behav -key {Behavioral:sim_1:Functional:design_1_wrapper} -tclbatch design_1_wrapper.tcl -protoinst "protoinst_files/bd_d10d.protoinst" -protoinst "protoinst_files/design_1.protoinst" -log simulate.log"
xsim design_1_wrapper_behav -key {Behavioral:sim_1:Functional:design_1_wrapper} -tclbatch design_1_wrapper.tcl -protoinst "protoinst_files/bd_d10d.protoinst" -protoinst "protoinst_files/design_1.protoinst" -log simulate.log

