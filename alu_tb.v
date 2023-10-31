`timescale 1ns/1ps

module alu_tb;

  // Instantiate the eight-bit adder modules(the full adder has already been tested)
  reg [7:0] a, b;
  reg cin;
  wire [7:0] sum;
  wire [7:0] negated;
  wire [7:0] difference;
  wire cout;

  add8 A8 (.sum(sum), .cout(cout), .a(a), .b(b));
  neg8 N8(.out(negated), .a(a));
  sub8 S8(.out(difference), .a(a), .b(b));

  initial begin
    #10 a = 8'b01011010;
    #10 b = 8'b00001010;
    $display("Input: a=%b, b=%b", a, b);
    #10;
    // Display the results
    $display("Output: sum=%b, cout=%b", sum, cout);
    #10;
    $display("Negated: neg(a)=%b", negated);

    $display("Subtracted(a-b)=%b", difference);

    // Finish the simulation
    $finish;
  end

endmodule
