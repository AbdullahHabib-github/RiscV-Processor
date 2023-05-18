`include "four_adder.v"

module four_adder_tb;

  // Inputs
  reg [31:0] input_1;

  // Outputs
  wire [31:0] adder_output;

  // Instantiate the four_adder module
  four_adder dut (
    .input_1(input_1),
    .adder_output(adder_output)
  );

  // Clock signal
  reg clk = 0;

  // Test inputs
  initial begin
    input_1 = 10;

    #10 input_1 = 5;
    #10 input_1 = 15;
    #10 input_1 = 0;
    #10 input_1 = 4294967291; // largest unsigned 32-bit number

    #10 $finish;
  end

  // Clock generator
  always #5 clk = ~clk;

endmodule
