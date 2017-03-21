`timescale 1ns / 1ps

module tb_receiver();

reg clk;
wire received;
wire [7:0]data_received;
reg [7:0]data2send;
reg sendreg;
reg [7:0]i;
wire txd;
integer file_in;
integer file_out;

initial
begin
    file_in=$fopen("C:/Users/Mariusz/asd.txt", "rb");
    file_out=$fopen("xd.txt", "wb");
    for(i=0; i<4; i=i+1)
    begin
        data2send<=$fgetc(file_in);
        sendreg<=1'b1;
        #4;
        sendreg<=1'b0;
        #20;
    end
    $fclose(file_in);
    $fclose(file_out);    
end

initial
begin
  while(1)
  begin
    #1; clk<=1'b0;
    #1; clk<=1'b1;
  end
end

state_machine st
(
    .clk(clk),
    .send(sendreg),
    .data(data2send),
    .txd(txd)
);

receiver r
(
    .clk(clk),
    .data(data_received),
    .received(received),
    .rst(1'b0),
    .txd(txd)
);

always @(posedge received)
begin
    $fwrite(file_out, "%c", data_received);
end
endmodule
