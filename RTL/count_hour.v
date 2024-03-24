module count_hour 
(
		clk
	 ,rst_n
	 ,count_hour
	 ,set_hour
	 ,hour
);

  input            clk       ;
  input            rst_n     ;
  input            count_hour;
	input            set_hour  ;
  output reg [4:0] hour      ;

  always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			hour <= 5'd0;
		end
		else if(count_hour || set_hour) begin
			hour <= hour + 5'd1;
		end
		else begin
			hour <= hour;
		end
	end
endmodule

