module clock_generation
(
    clk_in
	 ,clk_out 
);
  input clk_in;
  output reg clk_out;

	parameter CLOCK_FREQUENCY = 1000000; // Assuming 1 MHz input clock frequency
	
	reg [31:0] counter = 0;

	always @(posedge clk_in) begin
    if (counter == CLOCK_FREQUENCY - 1) begin
        counter <= 0;
        clk_out <= ~clk_out; // Toggle the output clock every second
    end else begin
        counter <= counter + 1;
    end
	end
endmodule


