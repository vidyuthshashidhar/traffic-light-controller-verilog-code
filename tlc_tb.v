`timescale 1ns / 1ps
module tlc_tb;
reg clk,reset;
wire red,yellow,green;

tlc uut(.clk(clk),.reset(reset),.red(red),.yellow(yellow),.green(green));

initial
begin
clk=0;
reset=1;
#15;
reset=0;
end


always
begin
clk=~clk;
#10;
end

endmodule
