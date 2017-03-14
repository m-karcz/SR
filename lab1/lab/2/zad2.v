`timescale 1ns / 1ps

module zad2 #
    (
        parameter N = 8,
        parameter WIDTH = $clog2(N)
    )
    (
        input clk,
        input ce,
        input rst,
        output [WIDTH:0]y
    );
    reg [WIDTH:0]val=1'b0;  
    always @(posedge clk)
    begin
        if(rst || val==N) val<=1'b0;
        else
            if(ce) val<=val+1;
            else val<=val;
    
    end
    assign y=val;
endmodule
