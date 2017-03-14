`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2017 12:56:44
// Design Name: 
// Module Name: zad3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module zad3(
    input [7:0]x,
    input [7:0]y,
    output z
    );
    wire [13:0]chain;
    genvar i;
    generate
        for(i=0;i<14;i=i+1)
        begin
        if(i<8)
            assign chain[i]=x[i]&y[i];
        else
            if(i<12)
                assign chain[i]=chain[(i-8)*2]|chain[(i-8)*2+1];
            else
                assign chain[i]=chain[(i-12)*2+8]&chain[(i-12)*2+9];
        end     
    endgenerate
        assign z=chain[12]|chain[13];        
endmodule
