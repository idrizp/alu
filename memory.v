module jk_flipflop (
    q,
    qbar,
    clk,
    j,
    k
);
    input j,k,clk;
    output q,qbar;

    wire nand1_out;
    wire nand2_out;

    nand (nand1_out, j, clk, qbar);
    nand (nand2_out, k, clk, q);

    nand(q, qbar, nand2_out);
    nand(qbar, q, nand1_out);
endmodule