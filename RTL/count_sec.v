module count_sec( 
  clk
 ,rst_n
 ,set_sec
 ,sec
 );

 input            clk    ;
 input            rst_n  ;
 input            set_sec;
 output reg [7:0] sec    ;

 always @(posedge clk or rst_n or set_sec) begin
 		if(~rst_n) begin
			sec <= 8'd0;
		end
		else begin
			sec <= sec + 8'd1;
	  end
	end
endmodule


