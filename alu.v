// A full-adder.
module add1 (
    sum,
    cout,
    a,
    b,
    cin
);
    input a, b, cin;
    output sum, cout;

    wire xor_a_b;
    xor(xor_a_b, a, b);
    xor(sum, xor_a_b, cin);

    wire and_a_b;
    and(and_a_b, a, b);

    wire and_cin_xor_ab;
    and(and_cin_xor_ab, cin, xor_a_b);

    or(cout, and_a_b, and_cin_xor_ab);
endmodule

// An eight-bit adder.
module add8 (
    cout,
    sum,
    a,
    b
);
    input [7:0] a, b;
    output [7:0] sum;
    output cout;

    wire [6:0] cin;

    add1 fa0(.sum(sum[0]), .cout(cin[0]), .a(a[0]), .b(b[0]), .cin(1'b0));
    generate
    genvar i;
    for (i = 1; i < 7; i = i+1) begin
        add1 fa(.sum(sum[i]), .cout(cin[i]), .a(a[i]), .b(b[i]), .cin(cin[i - 1]));
    end
    endgenerate
    add1 fa7(.sum(sum[7]), .cout(cout), .a(a[7]), .b(b[7]), .cin(cin[6]));

endmodule

// Using two's complement, we can negate an 8 bit number
module neg8(
    out,
    a
);
    input [7:0] a;
    output [7:0] out;

    wire [7:0] b;
    generate
        genvar i;
        for (i = 0; i < 8; i = i+1) begin
            not(b[i], a[i]);
        end
    endgenerate

    wire dummy_wire;
    add8 A8(
        .cout(dummy_wire),
        .sum(out),
        .a(b),
        .b(8'b01)
    );
endmodule

// Subtraction with 8 bit numbers
module sub8 (
    out,
    a,
    b
);
    input [7:0] a, b;
    output [7:0] out;
    
    wire[7:0] b_negated;
    neg8 N8(.out(b_negated),.a(b));

    wire dummy_wire;
    add8 A8(.cout(dummy_wire), .sum(out), .a(a), .b(b_negated));
endmodule