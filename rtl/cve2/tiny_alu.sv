//LUCA CABALLERO CUSIN
//FOR IVERILOG TESTING

module tiny_alu ( 
  input  logic [6:0]  operator_i, 
  input  logic [31:0] operand_a_i,
  input  logic [31:0] operand_b_i,
  output logic [31:0] result_o
);

  logic [33:0] raw_sum;
  logic [33:0] adder_result_ext_o;
  

  assign raw_sum = {1'b0, operand_a_i, 1'b1} + {1'b0, operand_b_i, 1'b0};

  always_comb begin
    adder_result_ext_o = raw_sum;

    if (operator_i == 7'h7F && raw_sum[33] == 1'b1) begin
      adder_result_ext_o = '1; // Set all 34 bits to 1
    end
  end

  assign result_o = adder_result_ext_o[32:1];

endmodule
