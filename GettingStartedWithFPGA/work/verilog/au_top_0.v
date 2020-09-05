/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [2:0] customout,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_fulladder_s;
  wire [1-1:0] M_fulladder_cout;
  reg [1-1:0] M_fulladder_x;
  reg [1-1:0] M_fulladder_y;
  reg [1-1:0] M_fulladder_cin;
  full_adder_1 fulladder (
    .x(M_fulladder_x),
    .y(M_fulladder_y),
    .cin(M_fulladder_cin),
    .s(M_fulladder_s),
    .cout(M_fulladder_cout)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    customout = 3'h7;
    M_fulladder_x = io_dip[0+0+0-:1];
    M_fulladder_y = io_dip[0+1+0-:1];
    M_fulladder_cin = io_dip[0+2+0-:1];
    io_led[16+1+0-:1] = M_fulladder_s;
    io_led[16+0+0-:1] = M_fulladder_cout;
  end
endmodule