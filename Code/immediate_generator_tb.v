`include "immediate_generator.v"
module immediate_generator_tb;

reg [31:0] instruction_code;
wire [31:0] immediate;

immediate_generator_tb uut(
    .instruction_code(instruction_code),
    .immediate(immediate)
);

initial begin
    // Load instruction test
    instruction_code = 32'b10000000000000010000001000110100; // lw x2, 0(x1)
    #10;
    assert (immediate === 32'b00000000000000000001001101000100);
    
    // Store instruction test
    instruction_code = 32'b11000000100000000000001000110100; // sw x0, 8(x1)
    #10;
    assert (immediate === 32'b00000000000000000010001101000100);
    
    // B-type instruction test
    instruction_code = 32'b11111110000001100000111001100011; // beq x2, x3, -100
    #10;
    assert (immediate === 32'b11111111111111111011101100000000);
    
    // Addi instruction test
    instruction_code = 32'b00010000000000001000000010010011; // addi x1, x1, 256
    #10;
    assert (immediate === 32'b00000000000000000000010000000000);
    
    // Jal instruction test
    instruction_code = 32'b11101111000000000000000000010001; // jal x1, -16
    #10;
    assert (immediate === 32'b11111111111110000000000000001011);
    
    // Jalr instruction test
    instruction_code = 32'b11110001000000000000011111100111; // jalr x31, x8, 64
    #10;
    assert (immediate === 32'b00000000000000000000000001000000);
    
    // Default instruction test
    instruction_code = 32'b11011110101011011011111011101111; // Invalid instruction
    #10;
    assert (immediate === 32'b00000000000000000000000000000000);
    
    $finish;
end

endmodule
