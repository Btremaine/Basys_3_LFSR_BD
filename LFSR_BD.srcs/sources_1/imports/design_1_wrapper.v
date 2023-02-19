//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Sat Feb 18 11:50:03 2023
//Host        : DESKTOP-2O9LISD running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (anode,
    cath_out,
    clk_5MHz,
    rst_n,
    update);
  output [3:0]anode;
  output [6:0]cath_out;
  input clk_5MHz;
  input rst_n;
  output update;

  wire [3:0]anode;
  wire [6:0]cath_out;
  wire clk_5MHz;
  wire rst_n;
  wire update;

  design_1 design_1_i
       (.anode(anode),
        .cath_out(cath_out),
        .clk_5MHz(clk_5MHz),
        .rst_n(rst_n),
        .update(update));
endmodule
