module count_day
( 
  clk
 ,rst_n
 ,count_day
 ,set_day
 ,day
);
  input            clk      ;
  input            rst_n    ;
	input            count_day;
	input            set_day  ;
  output reg [8:0] day      ;

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			day <= 9'd0;
	  end
		else if(count_day || set_day) begin
			day <= day + 7'd1;
		end
		else begin
			day <= day ;
	  end
	end
endmodule
