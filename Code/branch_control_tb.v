`include "branch_control.v"


`timescale 1ns / 1ps   // Define the time scale for the simulation

module branch_control_tb;

    // Inputs
    reg [31:0] alu_result;
    reg [2:0] func3;
    
    // Outputs
    wire jumpbranch;
    
    // Instantiate the module under test
    branch_control dut (
        .alu_result(alu_result),
        .func3(func3),
        .jumpbranch(jumpbranch)
    );
    
    // Initialize inputs
    initial begin
        alu_result = 0;
        func3 = 3'b000;

        #10 alu_result = -10;
        #5 func3 = 3'b100;

        #10 alu_result = 10;
        #5 func3 = 3'b101;

        #10 alu_result = 0;
        #5 func3 = 3'b111;
    end
    
  

endmodule
