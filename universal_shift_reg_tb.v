`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 22:02:30
// Design Name: 
// Module Name: universal_shift_reg_tb
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


module universal_shift_reg_tb(

    );
    reg clk;
    reg rst;
    reg [1:0]mode;
    reg [3:0]data_in;
    wire [3:0]data_out;
    
    
    universal_shift_reg dut(.clk(clk),.rst(rst),.data_in(data_in),.data_out(data_out),.mode(mode));
    
    initial begin
    clk=0;mode=2'b00;data_in=4'b0000;
    rst=1;#20;rst=0;#20;
    //right shift
    #20 mode=2'b01;
    data_in=4'b0011;
    //left shift
    #20 mode=2'b10;
    data_in=4'b0111;
    //parallel load mode
    #20 mode=2'b11;data_in=4'b1010;
    
    end
    
    always #5 clk=~clk;
    
    initial begin
    $monitor("Time=%t | mode=%b | data_in=%b | data_out=%b",$time,mode,data_in,data_out);
    #200 $finish;
    end
endmodule
