module instruction_memory(
 input [9:0] PC,
 input reset,
 output [31:0] Instruction_Code
);

reg [7:0] Memory [1024:0]; 
assign Instruction_Code = {Memory[PC+3], Memory[PC+2], Memory[PC+1], Memory[PC]};

parameter instr_1 = 32'h00400293;
parameter instr_2 = 32'h00900313;
parameter instr_3 = 32'h00c000ef;
parameter instr_4 = 32'h00e00293;
parameter instr_5 = 32'h01000313;
parameter instr_6 = 32'h006283b3;

always @(reset) begin
    if(reset == 1)
    begin
        Memory[3] = instr_1[31:24];
        Memory[2] = instr_1[23:16];
        Memory[1] = instr_1[15:8];
        Memory[0] = instr_1[7:0];

        Memory[7] = instr_2[31:24];
        Memory[6] = instr_2[23:16];
        Memory[5] = instr_2[15:8];
        Memory[4] = instr_2[7:0];

        Memory[11] = instr_3[31:24];
        Memory[10] = instr_3[23:16];
        Memory[9] = instr_3[15:8];
        Memory[8] = instr_3[7:0];

        Memory[15] = instr_4[31:24];
        Memory[14] = instr_4[23:16];
        Memory[13] = instr_4[15:8];
        Memory[12] = instr_4[7:0];

        Memory[19] = instr_5[31:24];
        Memory[18] = instr_5[23:16];
        Memory[17] = instr_5[15:8];
        Memory[16] = instr_5[7:0];

        Memory[23] = instr_6[31:24];
        Memory[22] = instr_6[23:16];
        Memory[21] = instr_6[15:8];
        Memory[20] = instr_6[7:0];
        // // 1 Setting 32-bit instruction: add x5, x6, x7 
        // Memory[3] = 8'b00000000;
        // Memory[2] = 8'b01110011;
        // Memory[1] = 8'b00000010;
        // Memory[0] = 8'b10110011;
        // // 2 Setting 32-bit instruction: sub x5, x6, x7
        // Memory[7] = 8'b01000000;
        // Memory[6] = 8'b01110011;
        // Memory[5] = 8'b00000010;
        // Memory[4] = 8'b10110011;
        // // 3 Setting 32-bit instruction:  and x5, x6, x7
        // Memory[11] = 8'b00000000;
        // Memory[10] = 8'b01110011;
        // Memory[9] = 8'b01110010;
        // Memory[8] = 8'b10110011;
        // // 4 Setting 32-bit instruction: or x5, x6, x7
        // Memory[15] = 8'b00000000;
        // Memory[14] = 8'b01110011;
        // Memory[13] = 8'b01100010;
        // Memory[12] = 8'b10110011;
        // // 5 Setting 32-bit instruction: addi x5, x6, 12
        // Memory[19] = 8'b00000000;
        // Memory[18] = 8'b11000011;
        // Memory[17] = 8'b00000010;
        // Memory[16] = 8'b10010011;
        // // 6 Setting 32-bit instruction: lw x5, 12(x6)
        // Memory[23] = 8'b00000000;
        // Memory[22] = 8'b11000011;
        // Memory[21] = 8'b00100010;
        // Memory[20] = 8'b10000011;
        // // 7 Setting 32-bit instruction: lb x5, 12(x6)
        // Memory[27] = 8'b00000000;
        // Memory[26] = 8'b11000011;
        // Memory[25] = 8'b00000010;
        // Memory[24] = 8'b10000011;
        // // 8 Setting 32-bit instruction: jalr x0, 0(x1)
        // Memory[31] = 8'b00000000;
        // Memory[30] = 8'b00000000;
        // Memory[29] = 8'b10000000;
        // Memory[28] = 8'b01100111;
        // // 9 Setting 32-bit instruction: beq x0 x0 24
        // Memory[35] = 8'b00000000;
        // Memory[34] = 8'b00000000;
        // Memory[33] = 8'b00001100;
        // Memory[32] = 8'b01100011;
        // // 10 Setting 32-bit instruction: blt x5, x6, 24 
        // Memory[39] = 8'b00000000;
        // Memory[38] = 8'b01100010;
        // Memory[37] = 8'b11001100;
        // Memory[36] = 8'b01100011;
        // // 11 Setting 32-bit instruction: blt x5, x6, 24 
        // Memory[43] = 8'b00000000;
        // Memory[42] = 8'b01100010;
        // Memory[41] = 8'b11011100;
        // Memory[40] = 8'b01100011;
        // // 12 Setting 32-bit instruction: sw x5, 12(x6)
        // Memory[47] = 8'b00000000;
        // Memory[46] = 8'b01010011;
        // Memory[45] = 8'b01010110;
        // Memory[44] = 8'b00100011;
        // // 13 Setting 32-bit instruction: sb x5, 12(x6)
        // Memory[51] = 8'b00000000;
        // Memory[50] = 8'b01010011;
        // Memory[49] = 8'b00000110;
        // Memory[48] = 8'b00100011;
        // // 14 Setting 32-bit instruction: jal x1, 12
        // Memory[55] = 8'b00000000;
        // Memory[54] = 8'b11000000;
        // Memory[53] = 8'b00000000;
        // Memory[52] = 8'b11101111;
    end
end
endmodule