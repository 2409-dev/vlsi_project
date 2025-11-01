// Verilog Testbench for 16-bit Carry Save Adder
// This file applies different test vectors to the carry save adder module,
// verifies its functional correctness by printing input and output values,
// and displays simulation time for debug purposes.
// The testbench includes stimulus for inputs and monitors sum/carry outputs.
module carry_save_adder_tb;
    reg [15:0] a, b, c;
    wire [15:0] sum, carry;

    carry_save_adder uut (
        .a(a), .b(b), .c(c),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display($time, " << Starting simulation >>");
        a = 16'd0; b = 16'd0; c = 16'd0;
        #10 a = 16'd10; b = 16'd5; c = 16'd7;
        #10 a = 16'd255; b = 16'd128; c = 16'd1;
        #10 a = 16'd32767; b = 16'd1; c = 16'd1;
        #10 a = 16'd65535; b = 16'd0; c = 16'd0;
        #10 a = 16'd12345; b = 16'd54321; c = 16'd11111;
        #10 $finish;
    end

    initial begin
        $monitor("a=%d, b=%d, c=%d, sum=%d, carry=%d", a, b, c, sum, carry);
    end
endmodule
