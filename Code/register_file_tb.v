`include "register_file.v"
module register_file_tb;
// Inputs
reg [4:0] read_reg_1;
reg [4:0] read_reg_2;
reg [4:0] write_reg;
reg [31:0] write_data;
reg regwrite;
reg clock;
reg reset;
// Outputs
wire [31:0] read_data1;
wire [31:0] read_data2;
// Instantiate the Unit Under Test (UUT)
register_file uut (
.read_reg_1(read_reg_1),
.read_reg_2(read_reg_2),
.write_reg(write_reg),
.write_data(write_data),
.read_data1(read_data1),
.read_data2(read_data2),
.regwrite(regwrite),
.clock(clock),
.reset(reset)
);
initial begin
 reset = 1;
 #10 reset = 0;
 end
initial begin
 regwrite = 0;
 #10
 regwrite = 1; write_data = 0; write_reg = 0;
 #10
 regwrite = 1; write_data = 30; write_reg = 1;
 #10
 regwrite = 1; write_data = 30; write_reg = 1;
 #10;
 end

initial begin
 #10 read_reg_1 = 0; read_reg_2 = 0;
 #10 read_reg_1 = 0; read_reg_2 = 1;
 #10 read_reg_1 = 1; read_reg_2 = 1;
 #10 read_reg_1 = 1; read_reg_2 = 2;

 end
 initial begin
 clock = 0;
 forever #10 clock = ~clock;
 end
 initial begin
 #200 $finish;
 end
endmodule