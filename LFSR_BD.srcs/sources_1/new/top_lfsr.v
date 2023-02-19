`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     Tremaine Consulting Group
// Engineer:    Brian Tremaine
// 
// Create Date: 02/18/2023 08:25:35 AM
// Design Name: 
// Module Name: top_lfsr
// Project Name:  
// Target Devices: Diligent Basys 3 board (Arix7)
// Tool Versions: 
// Description:  top module for Basys 3 project #2
//               Instantiate BD and add misc logic
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_lfsr (
   CLK100MHZ,    // board clock
   btnU,         // manual reset
   cath_out,     // cathode active low
   enable,       // anode active active high  clk1
   led
  );
  
  // list external pins by name in XDC file
  input CLK100MHZ;
  input btnU;             // use as manual reset
  output [2:0] led;
  output [6:0] cath_out;  // 7-seg display
  output [3:0] enable;    // 7-seg enable  
  
  // internal wires and reg
  wire update_1Hz;
  wire DONE;
  
  reg  Led;
  reg  [2:0]led;
  reg  btnU_1;
  reg  btnU_2;
  reg  btnU_3;
  
  // instaniate modified BD
  design_1_wrapper design_1_wrapper_1
   (.anode     (enable),
    .cath_out  (cath_out),
    .clk_5MHz  (sys_clk),
    .rst_n     (rst_n),
    .update    (update_1Hz) );    
  
  // reset generator 
  reset_gen reset_gen_1
   (.clk      (sys_clk),     // basys3 5Mhz
	.inp      (pulse),       // source of reset, active high debounced btn
	.rst_n    (rst_n) );     // reset output, active low
	
  // debounce button logic
  debounce debounce_1 (
   .clk         (sys_clk),       // 5Mhz
   .btn         (btnU_3),        // reset active high
   .outp        (pulse) );       // debounced output

  // system clock IP
  clk_wiz_0 clk_wiz_0_1
   (.clk_out1     (clk_5MHz), // 5Mhz 
    .locked       (locked),
    .clk_in1      (CLK100MHZ) );	 
	    
 // clk boundary crossing on btnU to remove instability
 always @(posedge sys_clk) begin
   btnU_1 <= btnU;
   btnU_2 <= btnU_1;
   btnU_3 <= btnU_2;
 end
   
 always @(posedge sys_clk ) begin    // sys_clk must be a clock source
    Led <= !btnU_3 && !Led && update_1Hz;     // no rst_n
    led[0] = Led;
    led[1] = DONE;
    led[2] = 1;
 end       
 
 assign sys_clk = clk_5MHz; 
 assign DONE = locked;
    
    
endmodule
