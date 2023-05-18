`include "data_memory.v"
module Data_memory_tb;
// Inputs
reg [31:0] write_data;
reg [31:0] address;
reg MemRead;
reg MemWrite;
reg clk;
reg byte;
// Outputs
wire [31:0] read_data;
// Instantiate the Unit Under Test (UUT)
data_memory uut (
.read_data(read_data),
.write_data(write_data),
.address(address),
.MemRead(MemRead),
.MemWrite(MemWrite),
.byte(byte),
.clk(clk));
initial begin
byte = 0;
write_data = 32'b00000000000000000000000000000000;
address = 32'b00000000000000000000000000000001;
MemRead = 0;
MemRead = 1;
clk = 1;
#100;
write_data = 32'b00000000000000000000000000000001;
address = 32'b00000000000000000000000000000111;
MemRead = 1;
MemRead = 1;
clk = 1;
#100;
byte = 1;
 write_data = 32'b00000000000000000000000000000010;
address = 32'b00000000000000000000000000001111;
MemRead = 2;
MemRead = 1;
clk = 1;
#100;
end
always # 10 clk = ~clk;
endmodule