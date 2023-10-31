// A full-adder.
module full_adder (
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
module adder_8 (
    cout,
    sum,
    a,
    b
);
    input [7:0] a, b;
    output [7:0] sum;
    output cout;

    wire [6:0] cin;

    full_adder fa0(.sum(sum[0]), .cout(cin[0]), .a(a[0]), .b(b[0]), .cin(1'b0));
    generate
    genvar i;
    for (i = 1; i < 7; i = i+1) begin
        full_adder fa(.sum(sum[i]), .cout(cin[i]), .a(a[i]), .b(b[i]), .cin(cin[i - 1]));
    end
    endgenerate
    full_adder fa7(.sum(sum[7]), .cout(cout), .a(a[7]), .b(b[7]), .cin(cin[6]));

endmodule