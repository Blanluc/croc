module simd_dotp (  input clk,               // Declare input port for clock to allow counter to count up
                  input rstn, 
                  input logic[31:0] operand_a_i,
                  input logic[31:0] operand_b_i,             // Declare input port for reset to allow the counter to be reset to 0 when required
                  output logic[31:0] SIMD_result_o);    // Declare 4-bit output port to get the counter values

  // This always block will be triggered at the rising edge of clk (0->1)
  // Once inside this block, it checks if the reset is 0, if yes then change out to zero
  // If reset is 1, then design should be allowed to count up, so increment counter
  logic [31:0] SIMD_dotp_result;  // internal signal
  logic [31:0] mult; 

  //CAREFUL, u can mult in parallel. but what about the acc
  //  32/4=8
  genvar k;
  generate 
    for (k = 0; k < 4; k++) begin
      always@(posedge clk) begin
        mult[(k*8)+:8] <= operand_a_i[(k*8)+:8] * operand_b_i[(k*8)+:8];
        // 0,7 ; 8,15 ; 16,23 ...
      end
    end
  endgenerate

  //ACC
	integer i;
  always_comb begin
    SIMD_dotp_result = 32'd0;
    //temp=SIMD_dotp_result;
    for (i = 0; i < 4; i = i + 1) begin
			$display ("Current loop#%0d ", i);
      SIMD_dotp_result = SIMD_dotp_result +mult[(i*8) +:8];
		end

  end

  assign SIMD_result_o = SIMD_dotp_result;

endmodule