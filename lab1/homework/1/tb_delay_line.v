`timescale 1ns / 1ps

module tb_delay_line #
    (
        parameter DELAY=1,
        parameter N=8
    )
    ();
    reg [N-1:0]reg_in = 8'b00000000;
    wire [N-1:0]in;
    wire [N-1:0]out;
    wire clock;
    reg clk = 1'b0;
    
    initial
    begin
        while(1)
        begin
            #2; clk = 1'b0;
            #2; clk = 1'b1;
        end
    end
    
    initial
    begin
        while(1)
        begin
            #21; reg_in = 8'b11110000;
            #21; reg_in = 8'b00001111;
        end
    end
    
    assign clock=clk;
    assign in = reg_in;
    
    delay_line #(.DELAY(DELAY)) line
    (
        .clk(clock),
        .idata(in),
        .odata(out)
    );
endmodule
