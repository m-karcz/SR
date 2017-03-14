`timescale 1ns / 1ps

module d_flip_flop #
    (
        parameter N = 8
    )
    (
        input clk,
        input [N-1:0]d,
        output [N-1:0]q
    );
    reg [N-1:0]data;
    always@(posedge clk)
    begin
        data <= d;    
    end
    assign q = data;
endmodule
