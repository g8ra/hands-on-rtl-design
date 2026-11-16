module palindrome3b (
  input   logic        clk,
  input   logic        reset,
  input   logic        x_i,
  output  logic        palindrome_o
);

  logic [1:0] curr_count;
  logic [1:0] next_count;
  
  logic [1:0] curr_shift_reg;
  logic [1:0] next_shift_reg;
  
  always_ff @(posedge clk or posedge reset)
    if (reset) begin
      curr_count <= 2'b00;
      curr_shift_reg <= 2'b00;
    end 
    else begin
      curr_count <= next_count;
      curr_shift_reg <= next_shift_reg;
    end
  
  assign next_count = curr_count[1] ? curr_count : curr_count + 2'b01;
  assign next_shift_reg = {curr_shift_reg[0], x_i};
  assign palindrome_o = (x_i == curr_shift_reg[1]) & curr_count[1];
    
endmodule
