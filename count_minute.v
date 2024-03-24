module count_minute
( 
  clk
 ,rst_n
 ,count_min
 ,set_min
 ,min
);
  input            clk      ;
  input            rst_n    ;
	input            count_min;
	input            set_min  ;
  output reg [6:0] min      ;


	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			min <= 7'd0;
	  end
		else if(count_min || set_min) begin
			min <= min + 7'd1;
		end
		else begin
			min <= min ;
	  end
	end
endmodule


 


