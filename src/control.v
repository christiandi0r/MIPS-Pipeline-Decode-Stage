`timescale 1ns / 1ps

module control(
    input wire       clk,
    input wire       rst,
    input wire [5:0] opcode,
    output reg [1:0] wb,
    output reg [2:0] mem,
    output reg [3:0] ex
);

    parameter RTYPE = 6'b000000;
    parameter LW    = 6'b100011;
    parameter SW    = 6'b101011;
    parameter BEQ   = 6'b000100;

    always @(*) begin
        if (rst) begin
            wb  = 2'b00;
            mem = 3'b000;
            ex  = 4'b0000;
        end
        else begin
            case (opcode)

                // R-format
                RTYPE: begin
                    wb  = 2'b10;   // RegWrite=1, MemToReg=0
                    mem = 3'b000;  // no memory, no branch
                    ex  = 4'b1100; // RegDst=1, ALUOp=10, ALUSrc=0
                end

                // LW
                LW: begin
                    wb  = 2'b11;   // RegWrite=1, MemToReg=1
                    mem = 3'b010;  // MemRead=1
                    ex  = 4'b0001; // ALUSrc=1
                end

                // SW
                SW: begin
                    wb  = 2'b00;
                    mem = 3'b001;  // MemWrite=1
                    ex  = 4'b0001; // ALUSrc=1
                end

                // BEQ
                BEQ: begin
                    wb  = 2'b00;
                    mem = 3'b100;  // Branch=1
                    ex  = 4'b0010; // ALUOp=01
                end

                default: begin
                    wb  = 2'b00;
                    mem = 3'b000;
                    ex  = 4'b0000;
                end
            endcase
        end
    end

endmodule
