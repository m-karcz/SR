`timescale 1ns / 1ps

module mux
    (
        input [2:0]a,
        input [7:0]x,
        output y
    );
    assign y=x[a];
endmodule
