`timescale 1ns / 1ps

module verify(
        input c
    );
    initial
    begin
        #10 if(c!=1'b0) $stop;
        #10 if(c!=1'b1) $stop;
        #10 if(c!=1'b0) $stop;
        #10 if(c!=1'b0) $stop;
        #10 if(c!=1'b0) $stop;
        #10 if(c!=1'b1) $stop;
        #10 if(c!=1'b0) $stop;
        #10 if(c!=1'b1) $stop;
    end

 endmodule

module tb_zad3(
);
    reg [7:0]x=8'b00000000;
    reg [7:0]y=8'b00000000;
    wire result;
    zad3 tested
    (
        .x(x),
        .y(y),
        .z(result)
    );
    verify ver
    (
        .c(result)
    );
    initial
    begin
        #10;
        x=8'b10101010;
        y=8'b10101010;
        #10;
        x=8'h00;
        y=8'b010101010;
        #10
        x=8'b010101010;
        y=8'b101010101;
        #10
        x=8'b11110000;
        y=8'b00001111;
        #10
        x=8'hff;
        y=8'hff;
        #10
        x=8'hff;
        y=8'h00;
        #10
        x=8'b10011001;
        y=8'b10011001;
    end
endmodule
