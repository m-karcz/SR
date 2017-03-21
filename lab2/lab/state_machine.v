`timescale 1ns / 1ps

module state_machine(
	input clk,
	input rst,
	input send,
	input [7:0]data,
	output txd
	);
	localparam WAIT_FOR_SEND=2'd0;
	localparam SET_START=2'd1;
	localparam SEND_DATA=2'd2;
	localparam END_TRANSMIT=2'd3;
    
	reg [1:0]state=WAIT_FOR_SEND;
	reg [7:0]data2send=8'hff;
	reg bit2send=1'b0;
	reg [2:0]index=3'd0;
	reg send_value=1'b0;
    
	assign txd = bit2send;
    
	always @(posedge clk)
	begin
	if(rst)
    	state<=WAIT_FOR_SEND;
	else
    	begin
        	case(state)
        	WAIT_FOR_SEND:
        	begin
            	bit2send<=1'b0;
            	if(send!=send_value)
            	begin
                	data2send<=data;
                	state<=SET_START;
            	end
        	end
        	SET_START:
        	begin
            	bit2send<=1'b1;
            	index<=3'd0;
            	state<=SEND_DATA;
        	end
        	SEND_DATA:
        	begin
            	bit2send<=data2send[index];
            	if(index==3'd7)
                	begin
                    	state<=END_TRANSMIT;
                    	index<=3'd0;
                	end
            	else
                	begin
                    	index<=index+1;
                	end
        	end
        	END_TRANSMIT:
        	begin
            	bit2send<=1'd0;
            	state<=WAIT_FOR_SEND;
        	end
        	endcase
        	send_value<=send;
    	end
	end
endmodule
