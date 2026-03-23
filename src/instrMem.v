`timescale 1ns / 1ps

module instrMem(clk, rst, addr, data);
    input clk, rst;
    input [31:0] addr;
    output wire [31:0] data;

    // 32-bit wide, 32-bit depth
    reg [31:0] mem [0:31];

    always @(posedge clk) begin
        if (rst) begin
            mem[0] <= 32'hA00000AA;  // address 0
            mem[1] <= 32'h10000011;  // address 4
            mem[2] <= 32'h20000022;  // address 8
            mem[3] <= 32'h30000033;  // address 12
            mem[4] <= 32'h40000044;  // address 16
            mem[5] <= 32'h50000055;  // address 20
            mem[6] <= 32'h60000066;  // address 24
            mem[7] <= 32'h70000077;  // address 28
            mem[8] <= 32'h80000088;  // address 32
            mem[9] <= 32'h90000099;  // address 36
        end
    end
     
    assign data = (rst) ? 32'h00000000 : mem[addr >> 2];
endmodule