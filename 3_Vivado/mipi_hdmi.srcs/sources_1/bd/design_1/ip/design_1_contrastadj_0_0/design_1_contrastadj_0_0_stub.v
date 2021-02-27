// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed Jan  6 18:49:25 2021
// Host        : guohui-FPGA running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vivado/mipi_hdmi.srcs/sources_1/bd/design_1/ip/design_1_contrastadj_0_0/design_1_contrastadj_0_0_stub.v
// Design      : design_1_contrastadj_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xazu5ev-sfvc784-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "contrastadj,Vivado 2020.1" *)
module design_1_contrastadj_0_0(adj_ap_vld, src_axi_TVALID, src_axi_TREADY, 
  src_axi_TDATA, src_axi_TKEEP, src_axi_TSTRB, src_axi_TUSER, src_axi_TLAST, src_axi_TID, 
  src_axi_TDEST, dst_axi_TVALID, dst_axi_TREADY, dst_axi_TDATA, dst_axi_TKEEP, dst_axi_TSTRB, 
  dst_axi_TUSER, dst_axi_TLAST, dst_axi_TID, dst_axi_TDEST, adj, ap_clk, ap_rst_n)
/* synthesis syn_black_box black_box_pad_pin="adj_ap_vld,src_axi_TVALID,src_axi_TREADY,src_axi_TDATA[23:0],src_axi_TKEEP[2:0],src_axi_TSTRB[2:0],src_axi_TUSER[0:0],src_axi_TLAST[0:0],src_axi_TID[0:0],src_axi_TDEST[0:0],dst_axi_TVALID,dst_axi_TREADY,dst_axi_TDATA[23:0],dst_axi_TKEEP[2:0],dst_axi_TSTRB[2:0],dst_axi_TUSER[0:0],dst_axi_TLAST[0:0],dst_axi_TID[0:0],dst_axi_TDEST[0:0],adj[31:0],ap_clk,ap_rst_n" */;
  input adj_ap_vld;
  input src_axi_TVALID;
  output src_axi_TREADY;
  input [23:0]src_axi_TDATA;
  input [2:0]src_axi_TKEEP;
  input [2:0]src_axi_TSTRB;
  input [0:0]src_axi_TUSER;
  input [0:0]src_axi_TLAST;
  input [0:0]src_axi_TID;
  input [0:0]src_axi_TDEST;
  output dst_axi_TVALID;
  input dst_axi_TREADY;
  output [23:0]dst_axi_TDATA;
  output [2:0]dst_axi_TKEEP;
  output [2:0]dst_axi_TSTRB;
  output [0:0]dst_axi_TUSER;
  output [0:0]dst_axi_TLAST;
  output [0:0]dst_axi_TID;
  output [0:0]dst_axi_TDEST;
  input [31:0]adj;
  input ap_clk;
  input ap_rst_n;
endmodule
