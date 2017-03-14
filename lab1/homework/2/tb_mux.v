`timescale 1ns / 1ps

module tb_mux
    ();
    reg [7:0]x=8'd0;
    reg [2:0]a=3'd0;
    wire result;
    mux m
    (
        .x(x),
        .a(a),
        .y(result)
    );
    initial
    begin
        forever
        begin
            #1; a<=a+1;
        end
    end
    initial
    begin
        forever
        begin
            #8; x<=x+1;
        end
    end
endmodule
