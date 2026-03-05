//LUCA CABALLERO CUSIN
//FOR IVERILOG TESTING

module tb_tiny;
  logic [6:0]  op;
  logic [31:0] a, b, res;

  tiny_alu dut (
    .operator_i  (op),
    .operand_a_i (a),
    .operand_b_i (b),
    .result_o    (res)
  );

  initial begin
    
    // Normal Add
    op = 7'h00; a = 32'hFFFF_FFFF; b = 32'h0000_0001;
    #10;
    $display("Normal Add: %h + %h = %h", a, b, res);

    // Saturated Add
    op = 7'h7F; a = 32'hFFFF_FFFE; b = 32'h0000_0005;
    #10;
    if (res == 32'hFFFF_FFFF)
      $display("SUCCESS %h", res);
    else
      $display("FAILURE %h", res);

    $finish;
  end
endmodule
