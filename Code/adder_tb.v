`include "adder.v"

module adder_tb;

  // Inputs
  reg [31:0] input_1;
  reg [31:0] input_2;

  // Outputs
  wire [31:0] adder_output;

  // Instantiate the adder module
  adder dut (
    .input_1(input_1),
    .input_2(input_2),
    .adder_output(adder_output)
  );

  // Clock signal
  reg clk = 0;

  // Test inputs
  initial begin
    input_1 = 10;
    input_2 = 20;

    #10 input_1 = 5;
    #10 input_2 = 15;

    #10 input_1 = 7;
    #10 input_2 = 3;

    #10 input_1 = 0;
    #10 input_2 = 0;

    #10 $finish;
  end

  // Clock generator
  always #5 clk = ~clk;

endmodule
