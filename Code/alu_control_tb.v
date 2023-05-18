`include "alu_control.v"


module alu_control_tb;

    // Inputs
    reg [1:0] ALUOp;
    reg [3:0] func;
    
    // Outputs
    wire [2:0] alu_control;
    
    // Instantiate the module under test
    alu_control dut (
        .ALUOp(ALUOp),
        .func(func),
        .alu_control(alu_control)
    );
    
   
    
    initial begin
        // Test case 1: ALUOp == 2'b00 (Add)
        ALUOp = 2'b00;
        func = 4'b0000;
        #20;

        // Test case 2: ALUOp == 2'b01 (Sub)
        ALUOp = 2'b01;
        func = 4'b0000;
        #20;

        // Test case 3: ALUOp == 2'b10 (And, Or, Addi, Store, Btype)
 
        ALUOp = 2'b10;
 
        // Test Addi (func = 7'b0010011)
        func = 7'b0010011;
        #20;
        
        // Test Store (func = 7'b0100011)
        func = 7'b0100011;
        #20;
        
        // Test Btype (func = 7'b1100011)
        func = 7'b1100011;
        #20;
        
        // Test And (func = 4'b0111)
        func = 4'b0111;
        #20;
        
        // Test Or (func = 4'b0110)
        func = 4'b0110;
        #20;

        // Test case 4: default case
        ALUOp = 2'b11;
        func = 4'b0000;
    end

  
endmodule
