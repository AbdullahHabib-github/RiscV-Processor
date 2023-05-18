`include "mux_32.v"

module mux_32_tb;

reg [31:0] input_1;
reg [31:0] input_2;
reg control_line;
wire [31:0] output_line;

mux_32_tb uut (.input_1(input_1), .input_2(input_2), .control_line(control_line), .output_line(output_line));

initial begin
    // Test case 1
    input_1 = 32'b00000000000000000000000000000001;
    input_2 = 32'b00000000000000000000000000000010;
    control_line = 1'b0;
    #10;

    // Test case 2
    input_1 = 32'b00000000000000000000000000000100;
    input_2 = 32'b00000000000000000000000000001000;
    control_line = 1'b1;
    #10;

    // Test case 3
    input_1 = 32'b11111111111111111111111111111111;
    input_2 = 32'b00000000000000000000000000000000;
    control_line = 1'b0;
    #10;

    // Test case 4
    input_1 = 32'b10101010101010101010101010101010;
    input_2 = 32'b01010101010101010101010101010101;
    control_line = 1'b1;
    #10;
end

endmodule
