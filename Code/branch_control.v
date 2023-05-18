module branch_control (
 input [31:0] alu_result,
 input [2:0] func3,
 output reg jumpbranch
);


always @ (*) begin 
    if (func3 == 3'b000 & alu_result == 0) 
        jumpbranch = 1;
    else if (func3 == 3'b100 & alu_result < 0) 
        jumpbranch = 1;
    else if (func3 == 3'b101 & alu_result > 0)
        jumpbranch = 1;
    else
        jumpbranch = 0;
end


endmodule