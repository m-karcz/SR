`timescale 1ns / 1ps
module tb_and8 #
    (
        parameter LENGTH = 8
    )
    (
    );
    reg clk = 1'b0;
    reg [LENGTH-1:0]cnt = 8'b0;

    wire [LENGTH-1:0]in;

    wire result;

    initial
    begin
        while(1)
        begin
            #1; clk = 1'b0;
            #1; clk = 1'b1;
        end
    end

    always @(posedge clk)
    begin
        cnt <= cnt + 1;
    end

    assign in = cnt;
    and8 gate
    (
        .x(in),
        .y(result)
    );
endmodule

