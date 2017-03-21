`timescale 1ns / 1ps

module stimulate(
	output [7:0]data,
	output send
	);
	reg [7:0]data2send;
	reg sendreg;
	reg [7:0]i;
	integer file;
	assign data=data2send;
	assign send=sendreg;
	initial
	begin
   	 
    	file=$fopen("PATH_TO_OPEN", "rb");
    	for(i=0; i<4; i=i+1)
    	begin
        	data2send<=$fgetc(file);
        	sendreg<=1'b1;
        	#4;
        	sendreg<=1'b0;
        	#20;
    	end
    	$fclose(file);
	end
endmodule

module saver
(
	input txd,
	input clk
);
   
	integer file;
    
	always @(posedge clk)
	begin
   	    file=$fopen("wynik.txt", "ab");
    	$fwrite(file, txd);
    	$fclose(file);
	end
    
   
endmodule
    

module tb_state_machine();
	reg clk=1'b0;
	initial
	begin
    	while(1)
    	begin
        	#1; clk=1'b1;
        	#1; clk=1'b0;
    	end
	end
	wire txd;
	wire [7:0]data;
	wire send;
	stimulate st
	(
    	.data(data),
    	.send(send)
	);
	state_machine sm
	(
    	.data(data),
    	.send(send),
    	.txd(txd),
    	.clk(clk)
	);
	saver s
	(
    	.clk(clk),
    	.txd(txd)
	);
endmodule
