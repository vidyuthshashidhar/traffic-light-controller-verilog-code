`timescale 1ns / 1ps
module tlc(input clk,reset,output reg red,yellow,green);
parameter IDLE = 3'b000 , G100 = 3'b001 , G110 = 3'b010 , G001 = 3'b011 , G011 = 3'b100;
reg [2:0] pst,nst;
/////////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk, posedge reset)
begin
	if(reset)
		pst<=IDLE;
	else
	   pst<=nst;	   
end
///////////////////////////////////////////////////////////////////////////////////////////////////
always@(pst)
begin
case(pst)
IDLE:
    begin
    red<=1'b0;
    yellow<=1'b0;
    green<=1'b0;
    nst<=G100;
    end
G100:
    begin
    red<=1'b1;
    yellow<=1'b0;
    green<=1'b0;
    nst<=G110;
    end
G110:
    begin
    red<=1'b1;
    yellow<=1'b1;
    green<=1'b0;
    nst<=G001;
    end
G001:
    begin
    red<=1'b0;
    yellow<=1'b0;
    green<=1'b1;
    nst<=G011;
    end
G011:
     begin
     red<=1'b0;
     yellow<=1'b1;
     green<=1'b1;
     nst<=G100;
     end
endcase
end
endmodule
