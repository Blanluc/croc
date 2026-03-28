module tb_simd_dotp;
  reg clk;                     // Declare an internal TB variable called clk to drive clock to the design
  reg rstn;
  logic [31:0] operand_a_i;
  logic [31:0] operand_b_i;                  // Declare an internal TB variable called rstn to drive active low reset to design
  logic [31:0] SIMD_result_o;              // Declare a wire to connect to design output

  // Instantiate simd design and connect with Testbench variables
  

 simd_dotp doptp (.clk (clk),
                    .rstn (rstn),
                    .operand_a_i (operand_a_i),
                    .operand_b_i (operand_b_i),
                    .SIMD_result_o (SIMD_result_o));

  // Generate a clock that should be driven to design
  // This clock will flip its value every 5ns -> time period = 10ns -> freq = 100 MHz
  always #1 clk = ~clk;

  // This initial block forms the stimulus of the testbench
  initial begin
    // 1. Initialize
    clk = 0;
    rstn = 0; // Start in reset
    operand_a_i = 0;
    operand_b_i = 0;

    
    repeat (2) @(posedge clk);
    rstn = 1;

    
    @(posedge clk);
    operand_a_i = 32'h01010101; 
    operand_b_i = 32'h02020202; 

    
    @(posedge clk); 
    
    // let the combinational adder settle
    #1; 
    $display("in_a=%b, in_b=%b", operand_a_i, operand_b_i);
    $display("out = %d (expected 8 for 1*2 + 1*2 + 1*2 + 1*2)", SIMD_result_o);

    #20 $finish;
  end
endmodule