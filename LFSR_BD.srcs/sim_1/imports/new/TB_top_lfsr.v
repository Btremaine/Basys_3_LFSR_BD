//`include "timescale.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:23:24 AM
// Design Name: 
// Module Name: TB_top_lfsr
// Project Name: 
// Target Devices: Basys 3 development board
// Tool Versions: 
// Description:    Test bench file
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module  TB_top_lfsr;

// testbemch requirements
// inputs
  reg sys_clk;
  reg reset;
 //======================
 
  top_lfsr top_lfsr_1(
    // inputs
    .CLK100MHZ   (sys_clk),
    .btnU        (reset),      // active hihj reset
    // outputs
    .cath_out    (out),
    .enable      (enable),
    .led         (led0)
  );
     
 // internal wires and reg
 reg sys_clk;
 reg reset;
 
// new
 
    
always begin
 #5 sys_clk = !sys_clk;   // ~100Mhz
end  

    
initial begin                                 
   sys_clk = 0;
   reset = 0;
end

initial begin
// start bench test
#500 sys_clk = 0;
#50_000    reset = 1;
#50_000    reset = 0;
#50_000    reset = 1;
#500_000   reset = 0;
#50_000    reset = 1;
#500_000   reset = 0;
#50_000    reset = 1;
#500_000   reset = 0;
#10_000_000 reset = 1;
#5_000_000  reset = 0;

//#4_000_000 $finish;
#1_100_000_000 $finish ;
end

endmodule
