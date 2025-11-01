// 16-bit Carry Save Adder - Verilog RTL Code
// This module implements a carry save adder using full adders for each bit.
module carry_save_adder(
    input [15:0] a, b, c,
    output [15:0] sum,
    output [15:0] carry
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: CSA_STAGE
            full_adder FA (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate
endmodule

module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
