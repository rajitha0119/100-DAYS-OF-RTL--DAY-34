`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 21:56:54
// Design Name: 
// Module Name: universal_shift_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module universal_shift_reg(
    output reg[3:0]data_out,
    input clk,
    input rst,
    input [1:0]mode,
    input [3:0]data_in
    );
    always@(posedge clk)
    begin
    if(rst)
    data_out<=0;
    else
    begin
    case(mode)
    2'b00:data_out<=data_out;//no changes
    2'b01:data_out<={data_in[0],data_in[3:1]};
    2'b10:data_out<={data_in[2:0],data_in[3]};
    2'b11:data_out=data_in;
    endcase
    end
    end
endmodule
