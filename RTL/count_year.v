module count_year
( 
  clk
 ,rst_n
 ,count_year
 ,set_year
 ,year
);
  input             clk       ;
  input             rst_n     ;
	input             count_year;
	input             set_year  ;
  output reg [15:0] year      ;


	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			year <= 16'd0;
	  end
		else if(count_year || set_year) begin
			year <= year + 16'd1;
		end
		else begin
			year <= year ;
	  end
	end
endmodule
