`include "program_counter.v"
`include "instruction_memory.v"
`include "data_memory.v"
`include "register_file.v"
`include "control_unit.v"
`include "alu.v"
`include "alu_control.v"
`include "immediate_generator.v"
`include "mux_32.v"
`include "adder.v"
`include "four_adder.v"
`include "memory_control.v"
`include "branch_control.v"

module processor
(
    input clk,
    input reset
);
    
    // Inputs

    wire [9:0] instruction_address;
    wire [31:0] Instruction_Code;
    wire [31:0] adder_output;
    wire [31:0] mux_instr_1;

    //regfile
    wire [31:0] write_data_reg;
    wire [31:0] read_data1_reg;
    wire [31:0] read_data2_reg;


    wire [31:0] mux_instr_2;
    //control unit
    wire [6:0] opcode = Instruction_Code[6:0];
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire JAL;
    wire JALR;
    wire [31:0] immediate;
    wire [1:0] alu_control;
    wire [31:0] output_line_wire;
    wire [31:0] output_line1;
    wire [31:0] alu_result;
    wire byte;
    wire [31:0] read_data_mem;
wire jumpbranch;
wire or_output;
wire and_output;
    wire [31:0] four_adder_output;
    wire [31:0] pc_input;

    program_counter pc (
    .next_address(pc_input),
    .clk(clk),
    .reset(reset),
    .instruction_address(instruction_address)
    );
    
    instruction_memory imem (
        .PC(instruction_address),
        .reset(reset),
        .Instruction_Code(Instruction_Code)
    );

    register_file regfile (
        .read_reg_1(Instruction_Code[19:15]),
        .read_reg_2(Instruction_Code[24:20]),
        .write_reg(Instruction_Code[11:7]),
        .write_data(write_data_reg),
        .read_data1(read_data1_reg),
        .read_data2(read_data2_reg),
        .regwrite(RegWrite),
        .clock(clk),
        .reset(reset)
    );

    control_unit CU (
        .opcode(opcode),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .JAL(JAL),
        .JALR(JALR)    
    );


    immediate_generator imm_gen (
        .instruction_code(Instruction_Code),
        .immediate(immediate)
    );


    alu_control alu_con (
        .ALUOp(ALUOp),
        .func({Instruction_Code[30], Instruction_Code[14:12]}),
        .alu_control(alu_control)
    );

    

    mux_32 muxALU (
        .input_1(read_data2_reg),
        .input_2(immediate),
        .control_line(ALUSrc),
        .output_line(output_line_wire)
    );

   

    alu ALU (
        .input_1(read_data1_reg),
        .input_2(output_line_wire),
        .alu_control(alu_control),
        .alu_result(alu_result)
    );

    

    memory_control mem_con(
        .MemRead(MemRead), 
        .MemWrite(MemWrite),
        .func3(Instruction_Code[14:12]),
        .byte(byte)
    );

    wire [31:0] temp;
    assign temp = alu_result;

    data_memory data_mem(
        .address(temp), 
        .write_data(read_data2_reg),
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .byte(byte), 
        .clk(clk),
        .read_data(reg_write_input2) 
    );

    
    wire [31:0] reg_write_input2;
    assign reg_write_input2 = read_data_mem;
    mux_32 reg_write(
        .input_1(alu_result),
        .input_2(read_data_mem),
        .control_line(MemtoReg),
        .output_line(write_data_reg)
    );

    

    branch_control branch_con(
        .alu_result(alu_result),
        .func3(Instruction_Code[14:12]),
        .jumpbranch(jumpbranch)
    );

    

    or(or_output, jumpbranch, JAL);

    

    and(and_output, or_output, Branch);
    
    

    adder add (
        .input_1({{22{1'b0}}, instruction_address}), 
        .input_2(immediate),
        .adder_output(adder_output)
    );

    

    four_adder four_add (
        .input_1({{22{1'b0}}, instruction_address}), 
        .adder_output(four_adder_output)
    );

    

    mux_32 instr_1 (
        .input_1(four_adder_output),
        .input_2(adder_output),
        .control_line(and_output),
        .output_line(mux_instr_1)
    );

    

    mux_32 instr_2 (
        .input_1(mux_instr_1),
        .input_2(alu_result),
        .control_line(JALR),
        .output_line(mux_instr_2)
    );

    assign pc_input = mux_instr_2;

 endmodule