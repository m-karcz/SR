`timescale 1ns / 1ps

module tb_zad2 #(
        parameter N = 8
    )
    ();
    reg clk_reg= 1'b0;
    wire ce = 1'b1;
    wire clk;
    wire rst = 1'b0;
    wire [$clog2(N):0]result;   
    initial
    begin
        while(1)
        begin
            #1; clk_reg = 1'b0;
            #1; clk_reg = 1'b1;
        end
    end
    assign clk = clk_reg;
    zad2 timer
    (
        .ce(ce),
        .rst(rst),
        .y(result),
        .clk(clk)
    );
endmodule
