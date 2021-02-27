//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Thu Jan  7 11:29:28 2021
//Host        : guohui-FPGA running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (cam_gpio_tri_io,
    cam_i2c_scl_io,
    cam_i2c_sda_io,
    hdmi_out_clk,
    hdmi_out_data,
    hdmi_out_de,
    hdmi_out_hs,
    hdmi_out_i2c_scl_io,
    hdmi_out_i2c_sda_io,
    hdmi_out_vs,
    mipi_phy_if_clk_n,
    mipi_phy_if_clk_p,
    mipi_phy_if_data_n,
    mipi_phy_if_data_p);
  inout [0:0]cam_gpio_tri_io;
  inout cam_i2c_scl_io;
  inout cam_i2c_sda_io;
  output hdmi_out_clk;
  output [23:0]hdmi_out_data;
  output hdmi_out_de;
  output hdmi_out_hs;
  inout hdmi_out_i2c_scl_io;
  inout hdmi_out_i2c_sda_io;
  output hdmi_out_vs;
  input mipi_phy_if_clk_n;
  input mipi_phy_if_clk_p;
  input [1:0]mipi_phy_if_data_n;
  input [1:0]mipi_phy_if_data_p;

  wire [0:0]cam_gpio_tri_i_0;
  wire [0:0]cam_gpio_tri_io_0;
  wire [0:0]cam_gpio_tri_o_0;
  wire [0:0]cam_gpio_tri_t_0;
  wire cam_i2c_scl_i;
  wire cam_i2c_scl_io;
  wire cam_i2c_scl_o;
  wire cam_i2c_scl_t;
  wire cam_i2c_sda_i;
  wire cam_i2c_sda_io;
  wire cam_i2c_sda_o;
  wire cam_i2c_sda_t;
  wire hdmi_out_clk;
  wire [23:0]hdmi_out_data;
  wire hdmi_out_de;
  wire hdmi_out_hs;
  wire hdmi_out_i2c_scl_i;
  wire hdmi_out_i2c_scl_io;
  wire hdmi_out_i2c_scl_o;
  wire hdmi_out_i2c_scl_t;
  wire hdmi_out_i2c_sda_i;
  wire hdmi_out_i2c_sda_io;
  wire hdmi_out_i2c_sda_o;
  wire hdmi_out_i2c_sda_t;
  wire hdmi_out_vs;
  wire mipi_phy_if_clk_n;
  wire mipi_phy_if_clk_p;
  wire [1:0]mipi_phy_if_data_n;
  wire [1:0]mipi_phy_if_data_p;

  IOBUF cam_gpio_tri_iobuf_0
       (.I(cam_gpio_tri_o_0),
        .IO(cam_gpio_tri_io[0]),
        .O(cam_gpio_tri_i_0),
        .T(cam_gpio_tri_t_0));
  IOBUF cam_i2c_scl_iobuf
       (.I(cam_i2c_scl_o),
        .IO(cam_i2c_scl_io),
        .O(cam_i2c_scl_i),
        .T(cam_i2c_scl_t));
  IOBUF cam_i2c_sda_iobuf
       (.I(cam_i2c_sda_o),
        .IO(cam_i2c_sda_io),
        .O(cam_i2c_sda_i),
        .T(cam_i2c_sda_t));
  design_1 design_1_i
       (.cam_gpio_tri_i(cam_gpio_tri_i_0),
        .cam_gpio_tri_o(cam_gpio_tri_o_0),
        .cam_gpio_tri_t(cam_gpio_tri_t_0),
        .cam_i2c_scl_i(cam_i2c_scl_i),
        .cam_i2c_scl_o(cam_i2c_scl_o),
        .cam_i2c_scl_t(cam_i2c_scl_t),
        .cam_i2c_sda_i(cam_i2c_sda_i),
        .cam_i2c_sda_o(cam_i2c_sda_o),
        .cam_i2c_sda_t(cam_i2c_sda_t),
        .hdmi_out_clk(hdmi_out_clk),
        .hdmi_out_data(hdmi_out_data),
        .hdmi_out_de(hdmi_out_de),
        .hdmi_out_hs(hdmi_out_hs),
        .hdmi_out_i2c_scl_i(hdmi_out_i2c_scl_i),
        .hdmi_out_i2c_scl_o(hdmi_out_i2c_scl_o),
        .hdmi_out_i2c_scl_t(hdmi_out_i2c_scl_t),
        .hdmi_out_i2c_sda_i(hdmi_out_i2c_sda_i),
        .hdmi_out_i2c_sda_o(hdmi_out_i2c_sda_o),
        .hdmi_out_i2c_sda_t(hdmi_out_i2c_sda_t),
        .hdmi_out_vs(hdmi_out_vs),
        .mipi_phy_if_clk_n(mipi_phy_if_clk_n),
        .mipi_phy_if_clk_p(mipi_phy_if_clk_p),
        .mipi_phy_if_data_n(mipi_phy_if_data_n),
        .mipi_phy_if_data_p(mipi_phy_if_data_p));
  IOBUF hdmi_out_i2c_scl_iobuf
       (.I(hdmi_out_i2c_scl_o),
        .IO(hdmi_out_i2c_scl_io),
        .O(hdmi_out_i2c_scl_i),
        .T(hdmi_out_i2c_scl_t));
  IOBUF hdmi_out_i2c_sda_iobuf
       (.I(hdmi_out_i2c_sda_o),
        .IO(hdmi_out_i2c_sda_io),
        .O(hdmi_out_i2c_sda_i),
        .T(hdmi_out_i2c_sda_t));
endmodule
