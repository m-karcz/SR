`timescale 1ns / 1ps
module tb_or_gate
();
    reg [9:0]data = 10'd0;
    integer i;
    integer file;
    wire result;
    
    initial
    begin
        file=$fopen("wrong.txt", "wb");
        for(i = 0; i < 1024; i = i+1)
        begin
            if((data == 10'd0 && result == 1'b1) || (data != 10'd0 && result == 1'b0))
                $fwrite(file, "%b\n", data);
            #1; data <= data+1;
            $fflush(file);
        end
        $fclose(file);
    end 
    or_gate tested
    (
        .i(data),
        .o(result)
    );  
endmodule
