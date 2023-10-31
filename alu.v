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

    wire xor_a_b_cin;
    xor(sum, xor_a_b, cin);

    wire and_a_b;
    and(and_a_b, a, b);
    or(cout, and_a_b, xor_a_b);
endmodule
