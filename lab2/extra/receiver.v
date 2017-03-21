`timescale 1ns / 1ps

module receiver(
  input clk,
  input rst,
  input txd,
  output [7:0]data,
  output received
);
  localparam WAIT_FOR_RECEIVE=2'd0;
  localparam GET_DATA=2'd2;
  localparam END_GETTING=2'd3;

  reg [1:0]state=WAIT_FOR_RECEIVE;
  reg [7:0]data2receive=8'h00;
  reg [7:0]data2show=8'h00;
  reg rec=1'd0;
  reg [2:0]index=3'd0;

  assign data = data2show;
  assign received = rec;

  always @(posedge clk)
  begin
  if(rst)
    state<=WAIT_FOR_RECEIVE;
  else
    begin
      case(state)
      WAIT_FOR_RECEIVE:
      begin
        if(txd==1'b1)
        begin
          index<=3'd0;
          state<=GET_DATA;
        end
      end
      GET_DATA:
      begin
        data2receive[index]<=txd;
        if(index==3'd7)
        begin
          rec<=1'b1;
          state<=END_GETTING;
          data2show<=data2receive;
        end
        else
          index<=index+1;
      end
      END_GETTING:
      begin
        rec<=1'b0;
        state<=WAIT_FOR_RECEIVE;
      end
      endcase
    end
  end

        

endmodule
