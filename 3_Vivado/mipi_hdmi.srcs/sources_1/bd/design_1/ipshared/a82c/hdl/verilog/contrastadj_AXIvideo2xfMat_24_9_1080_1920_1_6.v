// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module contrastadj_AXIvideo2xfMat_24_9_1080_1920_1_6 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        img1_431_din,
        img1_431_full_n,
        img1_431_write,
        src_axi_TDATA,
        src_axi_TVALID,
        src_axi_TREADY,
        src_axi_TKEEP,
        src_axi_TSTRB,
        src_axi_TUSER,
        src_axi_TLAST,
        src_axi_TID,
        src_axi_TDEST,
        adj,
        adj_ap_vld,
        adj_out_din,
        adj_out_full_n,
        adj_out_write
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_pp1_stage0 = 8'd16;
parameter    ap_ST_fsm_state7 = 8'd32;
parameter    ap_ST_fsm_state8 = 8'd64;
parameter    ap_ST_fsm_state9 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [23:0] img1_431_din;
input   img1_431_full_n;
output   img1_431_write;
input  [23:0] src_axi_TDATA;
input   src_axi_TVALID;
output   src_axi_TREADY;
input  [2:0] src_axi_TKEEP;
input  [2:0] src_axi_TSTRB;
input  [0:0] src_axi_TUSER;
input  [0:0] src_axi_TLAST;
input  [0:0] src_axi_TID;
input  [0:0] src_axi_TDEST;
input  [31:0] adj;
input   adj_ap_vld;
output  [31:0] adj_out_din;
input   adj_out_full_n;
output   adj_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg img1_431_write;
reg adj_out_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    img1_431_blk_n;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter1;
wire    ap_block_pp1_stage0;
reg   [0:0] icmp_ln132_reg_352;
reg    src_axi_TDATA_blk_n;
wire    ap_CS_fsm_state2;
reg    ap_enable_reg_pp1_iter0;
wire   [0:0] icmp_ln132_fu_312_p2;
wire   [0:0] or_ln138_fu_324_p2;
wire    ap_CS_fsm_state8;
wire   [0:0] ap_phi_mux_last_1_phi_fu_279_p4;
reg    adj_blk_n;
reg    adj_out_blk_n;
reg   [0:0] axi_last_V_1_reg_170;
reg   [23:0] axi_data_V_1_reg_181;
reg   [10:0] j_reg_192;
reg   [0:0] last_reg_203;
reg   [0:0] start_1_reg_215;
reg   [0:0] last_3_reg_226;
reg   [23:0] p_Val2_s_reg_239;
reg   [23:0] axi_data_V_reg_330;
reg   [0:0] axi_last_V_reg_338;
wire   [0:0] icmp_ln128_fu_300_p2;
wire    ap_CS_fsm_state4;
wire   [10:0] i_3_fu_306_p2;
reg   [10:0] i_3_reg_347;
reg    ap_predicate_op115_read_state5;
reg    ap_block_state5_pp1_stage0_iter0;
reg    ap_block_state6_pp1_stage0_iter1;
reg    ap_block_pp1_stage0_11001;
wire   [10:0] j_2_fu_318_p2;
reg    ap_block_state8;
reg    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state5;
reg   [0:0] axi_last_V_3_reg_252;
reg   [0:0] axi_last_V_0_reg_125;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state3;
reg   [23:0] axi_data_V_3_reg_264;
reg   [23:0] axi_data_V_0_reg_135;
reg   [10:0] i_reg_145;
reg   [0:0] start_reg_156;
reg   [0:0] ap_phi_mux_axi_last_V_1_phi_fu_173_p4;
reg   [23:0] ap_phi_mux_axi_data_V_1_phi_fu_184_p4;
reg   [0:0] ap_phi_mux_last_phi_fu_207_p4;
reg   [0:0] ap_phi_mux_start_1_phi_fu_218_p4;
wire   [0:0] ap_phi_reg_pp1_iter0_last_3_reg_226;
wire   [23:0] ap_phi_reg_pp1_iter0_p_Val2_s_reg_239;
wire    ap_CS_fsm_state7;
reg   [0:0] last_1_reg_276;
reg    ap_block_state1;
reg    ap_block_pp1_stage0_01001;
wire   [0:0] axi_user_V_fu_296_p1;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
wire    regslice_both_AXI_video_strm_V_data_V_U_apdone_blk;
wire   [23:0] src_axi_TDATA_int_regslice;
wire    src_axi_TVALID_int_regslice;
reg    src_axi_TREADY_int_regslice;
wire    regslice_both_AXI_video_strm_V_data_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_keep_V_U_apdone_blk;
wire   [2:0] src_axi_TKEEP_int_regslice;
wire    regslice_both_AXI_video_strm_V_keep_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_keep_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_strb_V_U_apdone_blk;
wire   [2:0] src_axi_TSTRB_int_regslice;
wire    regslice_both_AXI_video_strm_V_strb_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_strb_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_user_V_U_apdone_blk;
wire   [0:0] src_axi_TUSER_int_regslice;
wire    regslice_both_AXI_video_strm_V_user_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_user_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_last_V_U_apdone_blk;
wire   [0:0] src_axi_TLAST_int_regslice;
wire    regslice_both_AXI_video_strm_V_last_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_last_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_id_V_U_apdone_blk;
wire   [0:0] src_axi_TID_int_regslice;
wire    regslice_both_AXI_video_strm_V_id_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_id_V_U_ack_in;
wire    regslice_both_AXI_video_strm_V_dest_V_U_apdone_blk;
wire   [0:0] src_axi_TDEST_int_regslice;
wire    regslice_both_AXI_video_strm_V_dest_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_dest_V_U_ack_in;
reg    ap_condition_159;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
end

regslice_both #(
    .DataWidth( 24 ))
regslice_both_AXI_video_strm_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TDATA),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_data_V_U_ack_in),
    .data_out(src_axi_TDATA_int_regslice),
    .vld_out(src_axi_TVALID_int_regslice),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 3 ))
regslice_both_AXI_video_strm_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TKEEP),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_keep_V_U_ack_in),
    .data_out(src_axi_TKEEP_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_keep_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 3 ))
regslice_both_AXI_video_strm_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TSTRB),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_strb_V_U_ack_in),
    .data_out(src_axi_TSTRB_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_strb_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TUSER),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_user_V_U_ack_in),
    .data_out(src_axi_TUSER_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_user_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_user_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TLAST),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_last_V_U_ack_in),
    .data_out(src_axi_TLAST_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_last_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TID),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_id_V_U_ack_in),
    .data_out(src_axi_TID_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_id_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_id_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(src_axi_TDEST),
    .vld_in(src_axi_TVALID),
    .ack_in(regslice_both_AXI_video_strm_V_dest_V_U_ack_in),
    .data_out(src_axi_TDEST_int_regslice),
    .vld_out(regslice_both_AXI_video_strm_V_dest_V_U_vld_out),
    .ack_out(src_axi_TREADY_int_regslice),
    .apdone_blk(regslice_both_AXI_video_strm_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state5);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_data_V_0_reg_135 <= axi_data_V_reg_330;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        axi_data_V_0_reg_135 <= axi_data_V_3_reg_264;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        axi_data_V_1_reg_181 <= p_Val2_s_reg_239;
    end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
        axi_data_V_1_reg_181 <= axi_data_V_0_reg_135;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_data_V_3_reg_264 <= axi_data_V_1_reg_181;
    end else if ((~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0))) begin
        axi_data_V_3_reg_264 <= src_axi_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_last_V_0_reg_125 <= axi_last_V_reg_338;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        axi_last_V_0_reg_125 <= axi_last_V_3_reg_252;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        axi_last_V_1_reg_170 <= last_3_reg_226;
    end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
        axi_last_V_1_reg_170 <= axi_last_V_0_reg_125;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_last_V_3_reg_252 <= axi_last_V_1_reg_170;
    end else if ((~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0))) begin
        axi_last_V_3_reg_252 <= src_axi_TLAST_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_reg_145 <= 11'd0;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        i_reg_145 <= i_3_reg_347;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_fu_312_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        j_reg_192 <= j_2_fu_318_p2;
    end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
        j_reg_192 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        last_1_reg_276 <= last_reg_203;
    end else if ((~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0))) begin
        last_1_reg_276 <= src_axi_TLAST_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_159)) begin
        if (((or_ln138_fu_324_p2 == 1'd0) & (icmp_ln132_fu_312_p2 == 1'd0))) begin
            last_3_reg_226 <= src_axi_TLAST_int_regslice;
        end else if (((or_ln138_fu_324_p2 == 1'd1) & (icmp_ln132_fu_312_p2 == 1'd0))) begin
            last_3_reg_226 <= ap_phi_mux_axi_last_V_1_phi_fu_173_p4;
        end else if ((1'b1 == 1'b1)) begin
            last_3_reg_226 <= ap_phi_reg_pp1_iter0_last_3_reg_226;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        last_reg_203 <= last_3_reg_226;
    end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
        last_reg_203 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_159)) begin
        if (((or_ln138_fu_324_p2 == 1'd0) & (icmp_ln132_fu_312_p2 == 1'd0))) begin
            p_Val2_s_reg_239 <= src_axi_TDATA_int_regslice;
        end else if (((or_ln138_fu_324_p2 == 1'd1) & (icmp_ln132_fu_312_p2 == 1'd0))) begin
            p_Val2_s_reg_239 <= ap_phi_mux_axi_data_V_1_phi_fu_184_p4;
        end else if ((1'b1 == 1'b1)) begin
            p_Val2_s_reg_239 <= ap_phi_reg_pp1_iter0_p_Val2_s_reg_239;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        start_1_reg_215 <= 1'd0;
    end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd0))) begin
        start_1_reg_215 <= start_reg_156;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        start_reg_156 <= 1'd1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        start_reg_156 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((src_axi_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        axi_data_V_reg_330 <= src_axi_TDATA_int_regslice;
        axi_last_V_reg_338 <= src_axi_TLAST_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_3_reg_347 <= i_3_fu_306_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        icmp_ln132_reg_352 <= icmp_ln132_fu_312_p2;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        adj_blk_n = adj_ap_vld;
    end else begin
        adj_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        adj_out_blk_n = adj_out_full_n;
    end else begin
        adj_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == adj_out_full_n) | (1'b0 == adj_ap_vld) | (ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        adj_out_write = 1'b1;
    end else begin
        adj_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln132_fu_312_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (real_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter0 == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_axi_data_V_1_phi_fu_184_p4 = p_Val2_s_reg_239;
    end else begin
        ap_phi_mux_axi_data_V_1_phi_fu_184_p4 = axi_data_V_1_reg_181;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_axi_last_V_1_phi_fu_173_p4 = last_3_reg_226;
    end else begin
        ap_phi_mux_axi_last_V_1_phi_fu_173_p4 = axi_last_V_1_reg_170;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_last_phi_fu_207_p4 = last_3_reg_226;
    end else begin
        ap_phi_mux_last_phi_fu_207_p4 = last_reg_203;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_start_1_phi_fu_218_p4 = 1'd0;
    end else begin
        ap_phi_mux_start_1_phi_fu_218_p4 = start_1_reg_215;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        img1_431_blk_n = img1_431_full_n;
    end else begin
        img1_431_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln132_reg_352 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        img1_431_write = 1'b1;
    end else begin
        img1_431_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((or_ln138_fu_324_p2 == 1'd0) & (icmp_ln132_fu_312_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0)) | ((1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0)))) begin
        src_axi_TDATA_blk_n = src_axi_TVALID_int_regslice;
    end else begin
        src_axi_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_predicate_op115_read_state5 == 1'b1)) | (~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0)) | ((src_axi_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        src_axi_TREADY_int_regslice = 1'b1;
    end else begin
        src_axi_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == adj_out_full_n) | (1'b0 == adj_ap_vld) | (ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((src_axi_TVALID_int_regslice == 1'b1) & (axi_user_V_fu_296_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((src_axi_TVALID_int_regslice == 1'b1) & (axi_user_V_fu_296_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln128_fu_300_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((icmp_ln132_fu_312_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((icmp_ln132_fu_312_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if ((~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (last_1_reg_276 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else if ((~((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0)) & (1'b1 == ap_CS_fsm_state8) & (ap_phi_mux_last_1_phi_fu_279_p4 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign adj_out_din = adj;

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage0_01001 = (((ap_enable_reg_pp1_iter0 == 1'b1) & (src_axi_TVALID_int_regslice == 1'b0) & (ap_predicate_op115_read_state5 == 1'b1)) | ((icmp_ln132_reg_352 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (img1_431_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp1_stage0_11001 = (((ap_enable_reg_pp1_iter0 == 1'b1) & (src_axi_TVALID_int_regslice == 1'b0) & (ap_predicate_op115_read_state5 == 1'b1)) | ((icmp_ln132_reg_352 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (img1_431_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp1_stage0_subdone = (((ap_enable_reg_pp1_iter0 == 1'b1) & (src_axi_TVALID_int_regslice == 1'b0) & (ap_predicate_op115_read_state5 == 1'b1)) | ((icmp_ln132_reg_352 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (img1_431_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_state1 = ((1'b0 == adj_out_full_n) | (1'b0 == adj_ap_vld) | (ap_done_reg == 1'b1) | (real_start == 1'b0));
end

always @ (*) begin
    ap_block_state5_pp1_stage0_iter0 = ((src_axi_TVALID_int_regslice == 1'b0) & (ap_predicate_op115_read_state5 == 1'b1));
end

always @ (*) begin
    ap_block_state6_pp1_stage0_iter1 = ((icmp_ln132_reg_352 == 1'd0) & (img1_431_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state8 = ((src_axi_TVALID_int_regslice == 1'b0) & (last_1_reg_276 == 1'd0));
end

always @ (*) begin
    ap_condition_159 = ((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0));
end

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_phi_mux_last_1_phi_fu_279_p4 = last_1_reg_276;

assign ap_phi_reg_pp1_iter0_last_3_reg_226 = 'bx;

assign ap_phi_reg_pp1_iter0_p_Val2_s_reg_239 = 'bx;

always @ (*) begin
    ap_predicate_op115_read_state5 = ((or_ln138_fu_324_p2 == 1'd0) & (icmp_ln132_fu_312_p2 == 1'd0));
end

assign ap_ready = internal_ap_ready;

assign axi_user_V_fu_296_p1 = src_axi_TUSER_int_regslice;

assign i_3_fu_306_p2 = (i_reg_145 + 11'd1);

assign icmp_ln128_fu_300_p2 = ((i_reg_145 == 11'd1080) ? 1'b1 : 1'b0);

assign icmp_ln132_fu_312_p2 = ((j_reg_192 == 11'd1920) ? 1'b1 : 1'b0);

assign img1_431_din = p_Val2_s_reg_239;

assign j_2_fu_318_p2 = (j_reg_192 + 11'd1);

assign or_ln138_fu_324_p2 = (ap_phi_mux_start_1_phi_fu_218_p4 | ap_phi_mux_last_phi_fu_207_p4);

assign src_axi_TREADY = regslice_both_AXI_video_strm_V_data_V_U_ack_in;

assign start_out = real_start;

endmodule //contrastadj_AXIvideo2xfMat_24_9_1080_1920_1_6
