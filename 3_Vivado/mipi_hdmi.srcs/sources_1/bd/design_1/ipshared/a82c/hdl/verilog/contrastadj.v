// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="contrastadj_contrastadj,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu5ev-sfvc784-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=7.221000,HLS_SYN_LAT=2080098,HLS_SYN_TPT=2080084,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=19969,HLS_SYN_LUT=14405,HLS_VERSION=2020_1}" *)

module contrastadj (
        src_axi_TDATA,
        src_axi_TKEEP,
        src_axi_TSTRB,
        src_axi_TUSER,
        src_axi_TLAST,
        src_axi_TID,
        src_axi_TDEST,
        dst_axi_TDATA,
        dst_axi_TKEEP,
        dst_axi_TSTRB,
        dst_axi_TUSER,
        dst_axi_TLAST,
        dst_axi_TID,
        dst_axi_TDEST,
        adj,
        ap_clk,
        ap_rst_n,
        src_axi_TVALID,
        src_axi_TREADY,
        adj_ap_vld,
        dst_axi_TVALID,
        dst_axi_TREADY
);


input  [23:0] src_axi_TDATA;
input  [2:0] src_axi_TKEEP;
input  [2:0] src_axi_TSTRB;
input  [0:0] src_axi_TUSER;
input  [0:0] src_axi_TLAST;
input  [0:0] src_axi_TID;
input  [0:0] src_axi_TDEST;
output  [23:0] dst_axi_TDATA;
output  [2:0] dst_axi_TKEEP;
output  [2:0] dst_axi_TSTRB;
output  [0:0] dst_axi_TUSER;
output  [0:0] dst_axi_TLAST;
output  [0:0] dst_axi_TID;
output  [0:0] dst_axi_TDEST;
input  [31:0] adj;
input   ap_clk;
input   ap_rst_n;
input   src_axi_TVALID;
output   src_axi_TREADY;
input   adj_ap_vld;
output   dst_axi_TVALID;
input   dst_axi_TREADY;

 reg    ap_rst_n_inv;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_start;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_full_n;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_done;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_continue;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_idle;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_ready;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_out;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_write;
wire   [23:0] AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_din;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_write;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_src_axi_TREADY;
wire   [31:0] AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_din;
wire    AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_write;
wire    xfrgb2ycrcb_1080_1920_U0_ap_start;
wire    xfrgb2ycrcb_1080_1920_U0_ap_done;
wire    xfrgb2ycrcb_1080_1920_U0_ap_continue;
wire    xfrgb2ycrcb_1080_1920_U0_ap_idle;
wire    xfrgb2ycrcb_1080_1920_U0_ap_ready;
wire    xfrgb2ycrcb_1080_1920_U0_img1_431_read;
wire   [23:0] xfrgb2ycrcb_1080_1920_U0_img2_432_din;
wire    xfrgb2ycrcb_1080_1920_U0_img2_432_write;
wire    dualAryEqualize_1080_1920_256_U0_ap_start;
wire    dualAryEqualize_1080_1920_256_U0_ap_done;
wire    dualAryEqualize_1080_1920_256_U0_ap_continue;
wire    dualAryEqualize_1080_1920_256_U0_ap_idle;
wire    dualAryEqualize_1080_1920_256_U0_ap_ready;
wire    dualAryEqualize_1080_1920_256_U0_start_out;
wire    dualAryEqualize_1080_1920_256_U0_start_write;
wire    dualAryEqualize_1080_1920_256_U0_img2_432_read;
wire   [23:0] dualAryEqualize_1080_1920_256_U0_img3_433_din;
wire    dualAryEqualize_1080_1920_256_U0_img3_433_write;
wire    dualAryEqualize_1080_1920_256_U0_filter_read;
wire    xfycrcb2rgb_1080_1920_U0_ap_start;
wire    xfycrcb2rgb_1080_1920_U0_ap_done;
wire    xfycrcb2rgb_1080_1920_U0_ap_continue;
wire    xfycrcb2rgb_1080_1920_U0_ap_idle;
wire    xfycrcb2rgb_1080_1920_U0_ap_ready;
wire    xfycrcb2rgb_1080_1920_U0_start_out;
wire    xfycrcb2rgb_1080_1920_U0_start_write;
wire    xfycrcb2rgb_1080_1920_U0_img3_433_read;
wire   [23:0] xfycrcb2rgb_1080_1920_U0_img4_434_din;
wire    xfycrcb2rgb_1080_1920_U0_img4_434_write;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_start;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_done;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_continue;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_idle;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_ready;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_img4_434_read;
wire   [23:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDATA;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TVALID;
wire   [2:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TKEEP;
wire   [2:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TSTRB;
wire   [0:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TUSER;
wire   [0:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TLAST;
wire   [0:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TID;
wire   [0:0] xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDEST;
wire    ap_sync_continue;
wire    img1_data_full_n;
wire   [23:0] img1_data_dout;
wire    img1_data_empty_n;
wire    adj_c_full_n;
wire   [31:0] adj_c_dout;
wire    adj_c_empty_n;
wire    img2_data_full_n;
wire   [23:0] img2_data_dout;
wire    img2_data_empty_n;
wire    img3_data_full_n;
wire   [23:0] img3_data_dout;
wire    img3_data_empty_n;
wire    img4_data_full_n;
wire   [23:0] img4_data_dout;
wire    img4_data_empty_n;
wire   [0:0] start_for_xfrgb2ycrcb_1080_1920_U0_din;
wire    start_for_xfrgb2ycrcb_1080_1920_U0_full_n;
wire   [0:0] start_for_xfrgb2ycrcb_1080_1920_U0_dout;
wire    start_for_xfrgb2ycrcb_1080_1920_U0_empty_n;
wire   [0:0] start_for_dualAryEqualize_1080_1920_256_U0_din;
wire    start_for_dualAryEqualize_1080_1920_256_U0_full_n;
wire   [0:0] start_for_dualAryEqualize_1080_1920_256_U0_dout;
wire    start_for_dualAryEqualize_1080_1920_256_U0_empty_n;
wire    xfrgb2ycrcb_1080_1920_U0_start_full_n;
wire    xfrgb2ycrcb_1080_1920_U0_start_write;
wire   [0:0] start_for_xfycrcb2rgb_1080_1920_U0_din;
wire    start_for_xfycrcb2rgb_1080_1920_U0_full_n;
wire   [0:0] start_for_xfycrcb2rgb_1080_1920_U0_dout;
wire    start_for_xfycrcb2rgb_1080_1920_U0_empty_n;
wire   [0:0] start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_din;
wire    start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_full_n;
wire   [0:0] start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_dout;
wire    start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_empty_n;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_start_full_n;
wire    xfMat2AXIvideo_24_9_1080_1920_1_U0_start_write;

contrastadj_AXIvideo2xfMat_24_9_1080_1920_1_6 AXIvideo2xfMat_24_9_1080_1920_1_6_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_start),
    .start_full_n(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_full_n),
    .ap_done(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_done),
    .ap_continue(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_continue),
    .ap_idle(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_idle),
    .ap_ready(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_ready),
    .start_out(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_out),
    .start_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_write),
    .img1_431_din(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_din),
    .img1_431_full_n(img1_data_full_n),
    .img1_431_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_write),
    .src_axi_TDATA(src_axi_TDATA),
    .src_axi_TVALID(src_axi_TVALID),
    .src_axi_TREADY(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_src_axi_TREADY),
    .src_axi_TKEEP(src_axi_TKEEP),
    .src_axi_TSTRB(src_axi_TSTRB),
    .src_axi_TUSER(src_axi_TUSER),
    .src_axi_TLAST(src_axi_TLAST),
    .src_axi_TID(src_axi_TID),
    .src_axi_TDEST(src_axi_TDEST),
    .adj(adj),
    .adj_ap_vld(adj_ap_vld),
    .adj_out_din(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_din),
    .adj_out_full_n(adj_c_full_n),
    .adj_out_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_write)
);

contrastadj_xfrgb2ycrcb_1080_1920_s xfrgb2ycrcb_1080_1920_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(xfrgb2ycrcb_1080_1920_U0_ap_start),
    .ap_done(xfrgb2ycrcb_1080_1920_U0_ap_done),
    .ap_continue(xfrgb2ycrcb_1080_1920_U0_ap_continue),
    .ap_idle(xfrgb2ycrcb_1080_1920_U0_ap_idle),
    .ap_ready(xfrgb2ycrcb_1080_1920_U0_ap_ready),
    .img1_431_dout(img1_data_dout),
    .img1_431_empty_n(img1_data_empty_n),
    .img1_431_read(xfrgb2ycrcb_1080_1920_U0_img1_431_read),
    .img2_432_din(xfrgb2ycrcb_1080_1920_U0_img2_432_din),
    .img2_432_full_n(img2_data_full_n),
    .img2_432_write(xfrgb2ycrcb_1080_1920_U0_img2_432_write)
);

contrastadj_dualAryEqualize_1080_1920_256_s dualAryEqualize_1080_1920_256_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(dualAryEqualize_1080_1920_256_U0_ap_start),
    .start_full_n(start_for_xfycrcb2rgb_1080_1920_U0_full_n),
    .ap_done(dualAryEqualize_1080_1920_256_U0_ap_done),
    .ap_continue(dualAryEqualize_1080_1920_256_U0_ap_continue),
    .ap_idle(dualAryEqualize_1080_1920_256_U0_ap_idle),
    .ap_ready(dualAryEqualize_1080_1920_256_U0_ap_ready),
    .start_out(dualAryEqualize_1080_1920_256_U0_start_out),
    .start_write(dualAryEqualize_1080_1920_256_U0_start_write),
    .img2_432_dout(img2_data_dout),
    .img2_432_empty_n(img2_data_empty_n),
    .img2_432_read(dualAryEqualize_1080_1920_256_U0_img2_432_read),
    .img3_433_din(dualAryEqualize_1080_1920_256_U0_img3_433_din),
    .img3_433_full_n(img3_data_full_n),
    .img3_433_write(dualAryEqualize_1080_1920_256_U0_img3_433_write),
    .filter_dout(adj_c_dout),
    .filter_empty_n(adj_c_empty_n),
    .filter_read(dualAryEqualize_1080_1920_256_U0_filter_read)
);

contrastadj_xfycrcb2rgb_1080_1920_s xfycrcb2rgb_1080_1920_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(xfycrcb2rgb_1080_1920_U0_ap_start),
    .start_full_n(start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_full_n),
    .ap_done(xfycrcb2rgb_1080_1920_U0_ap_done),
    .ap_continue(xfycrcb2rgb_1080_1920_U0_ap_continue),
    .ap_idle(xfycrcb2rgb_1080_1920_U0_ap_idle),
    .ap_ready(xfycrcb2rgb_1080_1920_U0_ap_ready),
    .start_out(xfycrcb2rgb_1080_1920_U0_start_out),
    .start_write(xfycrcb2rgb_1080_1920_U0_start_write),
    .img3_433_dout(img3_data_dout),
    .img3_433_empty_n(img3_data_empty_n),
    .img3_433_read(xfycrcb2rgb_1080_1920_U0_img3_433_read),
    .img4_434_din(xfycrcb2rgb_1080_1920_U0_img4_434_din),
    .img4_434_full_n(img4_data_full_n),
    .img4_434_write(xfycrcb2rgb_1080_1920_U0_img4_434_write)
);

contrastadj_xfMat2AXIvideo_24_9_1080_1920_1_s xfMat2AXIvideo_24_9_1080_1920_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_start),
    .ap_done(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_done),
    .ap_continue(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_continue),
    .ap_idle(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_idle),
    .ap_ready(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_ready),
    .img4_434_dout(img4_data_dout),
    .img4_434_empty_n(img4_data_empty_n),
    .img4_434_read(xfMat2AXIvideo_24_9_1080_1920_1_U0_img4_434_read),
    .dst_axi_TDATA(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDATA),
    .dst_axi_TVALID(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TVALID),
    .dst_axi_TREADY(dst_axi_TREADY),
    .dst_axi_TKEEP(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TKEEP),
    .dst_axi_TSTRB(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TSTRB),
    .dst_axi_TUSER(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TUSER),
    .dst_axi_TLAST(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TLAST),
    .dst_axi_TID(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TID),
    .dst_axi_TDEST(xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDEST)
);

contrastadj_fifo_w24_d2_S img1_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_din),
    .if_full_n(img1_data_full_n),
    .if_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_img1_431_write),
    .if_dout(img1_data_dout),
    .if_empty_n(img1_data_empty_n),
    .if_read(xfrgb2ycrcb_1080_1920_U0_img1_431_read)
);

contrastadj_fifo_w32_d3_S adj_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_din),
    .if_full_n(adj_c_full_n),
    .if_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_adj_out_write),
    .if_dout(adj_c_dout),
    .if_empty_n(adj_c_empty_n),
    .if_read(dualAryEqualize_1080_1920_256_U0_filter_read)
);

contrastadj_fifo_w24_d2_S img2_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xfrgb2ycrcb_1080_1920_U0_img2_432_din),
    .if_full_n(img2_data_full_n),
    .if_write(xfrgb2ycrcb_1080_1920_U0_img2_432_write),
    .if_dout(img2_data_dout),
    .if_empty_n(img2_data_empty_n),
    .if_read(dualAryEqualize_1080_1920_256_U0_img2_432_read)
);

contrastadj_fifo_w24_d2_S img3_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(dualAryEqualize_1080_1920_256_U0_img3_433_din),
    .if_full_n(img3_data_full_n),
    .if_write(dualAryEqualize_1080_1920_256_U0_img3_433_write),
    .if_dout(img3_data_dout),
    .if_empty_n(img3_data_empty_n),
    .if_read(xfycrcb2rgb_1080_1920_U0_img3_433_read)
);

contrastadj_fifo_w24_d2_S img4_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xfycrcb2rgb_1080_1920_U0_img4_434_din),
    .if_full_n(img4_data_full_n),
    .if_write(xfycrcb2rgb_1080_1920_U0_img4_434_write),
    .if_dout(img4_data_dout),
    .if_empty_n(img4_data_empty_n),
    .if_read(xfMat2AXIvideo_24_9_1080_1920_1_U0_img4_434_read)
);

contrastadj_start_for_xfrgb2ycrcb_1080_1920_U0 start_for_xfrgb2ycrcb_1080_1920_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_xfrgb2ycrcb_1080_1920_U0_din),
    .if_full_n(start_for_xfrgb2ycrcb_1080_1920_U0_full_n),
    .if_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_write),
    .if_dout(start_for_xfrgb2ycrcb_1080_1920_U0_dout),
    .if_empty_n(start_for_xfrgb2ycrcb_1080_1920_U0_empty_n),
    .if_read(xfrgb2ycrcb_1080_1920_U0_ap_ready)
);

contrastadj_start_for_dualAryEqualize_1080_1920_256_U0 start_for_dualAryEqualize_1080_1920_256_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_dualAryEqualize_1080_1920_256_U0_din),
    .if_full_n(start_for_dualAryEqualize_1080_1920_256_U0_full_n),
    .if_write(AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_write),
    .if_dout(start_for_dualAryEqualize_1080_1920_256_U0_dout),
    .if_empty_n(start_for_dualAryEqualize_1080_1920_256_U0_empty_n),
    .if_read(dualAryEqualize_1080_1920_256_U0_ap_ready)
);

contrastadj_start_for_xfycrcb2rgb_1080_1920_U0 start_for_xfycrcb2rgb_1080_1920_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_xfycrcb2rgb_1080_1920_U0_din),
    .if_full_n(start_for_xfycrcb2rgb_1080_1920_U0_full_n),
    .if_write(dualAryEqualize_1080_1920_256_U0_start_write),
    .if_dout(start_for_xfycrcb2rgb_1080_1920_U0_dout),
    .if_empty_n(start_for_xfycrcb2rgb_1080_1920_U0_empty_n),
    .if_read(xfycrcb2rgb_1080_1920_U0_ap_ready)
);

contrastadj_start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0 start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_din),
    .if_full_n(start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_full_n),
    .if_write(xfycrcb2rgb_1080_1920_U0_start_write),
    .if_dout(start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_dout),
    .if_empty_n(start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_empty_n),
    .if_read(xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_ready)
);

assign AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_continue = 1'b1;

assign AXIvideo2xfMat_24_9_1080_1920_1_6_U0_ap_start = 1'b1;

assign AXIvideo2xfMat_24_9_1080_1920_1_6_U0_start_full_n = (start_for_xfrgb2ycrcb_1080_1920_U0_full_n & start_for_dualAryEqualize_1080_1920_256_U0_full_n);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_continue = 1'b0;

assign dst_axi_TDATA = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDATA;

assign dst_axi_TDEST = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TDEST;

assign dst_axi_TID = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TID;

assign dst_axi_TKEEP = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TKEEP;

assign dst_axi_TLAST = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TLAST;

assign dst_axi_TSTRB = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TSTRB;

assign dst_axi_TUSER = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TUSER;

assign dst_axi_TVALID = xfMat2AXIvideo_24_9_1080_1920_1_U0_dst_axi_TVALID;

assign dualAryEqualize_1080_1920_256_U0_ap_continue = 1'b1;

assign dualAryEqualize_1080_1920_256_U0_ap_start = start_for_dualAryEqualize_1080_1920_256_U0_empty_n;

assign src_axi_TREADY = AXIvideo2xfMat_24_9_1080_1920_1_6_U0_src_axi_TREADY;

assign start_for_dualAryEqualize_1080_1920_256_U0_din = 1'b1;

assign start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_din = 1'b1;

assign start_for_xfrgb2ycrcb_1080_1920_U0_din = 1'b1;

assign start_for_xfycrcb2rgb_1080_1920_U0_din = 1'b1;

assign xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_continue = 1'b1;

assign xfMat2AXIvideo_24_9_1080_1920_1_U0_ap_start = start_for_xfMat2AXIvideo_24_9_1080_1920_1_U0_empty_n;

assign xfMat2AXIvideo_24_9_1080_1920_1_U0_start_full_n = 1'b1;

assign xfMat2AXIvideo_24_9_1080_1920_1_U0_start_write = 1'b0;

assign xfrgb2ycrcb_1080_1920_U0_ap_continue = 1'b1;

assign xfrgb2ycrcb_1080_1920_U0_ap_start = start_for_xfrgb2ycrcb_1080_1920_U0_empty_n;

assign xfrgb2ycrcb_1080_1920_U0_start_full_n = 1'b1;

assign xfrgb2ycrcb_1080_1920_U0_start_write = 1'b0;

assign xfycrcb2rgb_1080_1920_U0_ap_continue = 1'b1;

assign xfycrcb2rgb_1080_1920_U0_ap_start = start_for_xfycrcb2rgb_1080_1920_U0_empty_n;

endmodule //contrastadj
