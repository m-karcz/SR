`timescale 1ns / 1ps

module delay_line #
    (
        parameter N=8,
        parameter DELAY=3
    )
    (
        input clk,
        input [N-1:0]idata,
        output [N-1:0]odata
    );
    wire [N-1:0]chain[DELAY:0];
    assign chain[0]=idata;
    genvar i;
    generate
        for(i=0; i<DELAY; i=i+1)
        begin
        d_flip_flop #(.N(N)) d_i
        (
            .clk(clk),
            .d(chain[i]),
            .q(chain[i+1])
        );
        end
    endgenerate
    assign odata=chain[DELAY];
endmodule