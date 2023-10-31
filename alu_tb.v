`timescale 1ns/1ps

module alu_tb;

  // Instantiate the full adder and eight-bit adder modules.
  reg [7:0] a, b;
  reg cin;
  wire [7:0] sum;
  wire cout;

  adder_8 A8 (.sum(sum), .cout(cout), .a(a), .b(b));

  initial begin
    #10 a = 8'b01011010;
    #10 b = 8'b00001010;
    $display("Input: a=%b, b=%b", a, b);
    #10;
    // Display the results
    $display("Output: sum=%b, cout=%b", sum, cout);

    // Finish the simulation
    $finish;
  end

endmodule
