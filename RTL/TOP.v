module TOP
(
		,clk
	  ,rst_n
    ,set_sec
		,set_min
		,set_hour
		,set_day
		,set_morth
		,set_year
		,led_sec_unit
		,led_sec_ten
		,led_min_unit
		,led_min_ten
		,led_hour_unit
		,led_hour_ten
		,led_day_hunder
		,led_day_ten
		,led_day_unit
		,led_morth_ten
		,led_morth_unit
		,led_year_thound
		,led_year_hunder
		,led_year_ten
		,led_year_unit
);
    input clk;
    input rst_n;
    input set_sec;
    input set_min;
    input set_hour;
    input set_day;
    input set_morth;
    input set_year;
    output [6:0] led_sec_unit;
    output [6:0] led_sec_ten;
    output [6:0] led_min_unit;
    output [6:0] led_min_ten;
    output [6:0] led_hour_unit;
    output [6:0] led_hour_ten;
    output [6:0] led_day_hunder;
    output [6:0] led_day_ten;
    output [6:0] led_day_unit;
    output [6:0] led_morth_ten;
    output [6:0] led_morth_unit;
    output [6:0] led_year_thound;
    output [6:0] led_year_hunder;
    output [6:0] led_year_ten;
    output [6:0] led_year_unit;
    
    wire         clk_1s;
    wire [7 :0]  second;
    wire [6 :0]  minute;
    wire [4 :0]  hour;
    wire [8 :0]  day;
    wire [3 :0]  morth;
    wire [15:0] year;
    
    wire [15:0] second_pad; 
    wire [15:0] minute_pad;
    wire [15:0] hour_pad  ;
    wire [15:0] day_pad   ;
    wire [15:0] morth_pad ;
    
    wire [3:0] bcd_sec_unit;  
    wire [3:0] bcd_min_unit;
    wire [3:0] bcd_hour_unit;
    wire [3:0] bcd_day_unit;
    wire [3:0] bcd_morth_unit;
    wire [3:0] bcd_year_unit;
    wire [3:0] bcd_sec_ten;
    wire [3:0] bcd_min_ten;
    wire [3:0] bcd_hour_ten ;
    wire [3:0] bcd_day_ten  ;
    wire [3:0] bcd_morth_ten;
    wire [3:0] bcd_year_ten;
    wire [3:0] bcd_day_hunder;
    wire [3:0] bcd_year_hunder;
    wire [3:0] bcd_year_thound;
    
    
    assign second_pad = {8'd0,second};
    assign minute_pad = {9'd0,minute};
    assign hour_pad = {11'd0,hour};
    assign day_pad = {7'd0,day};
    assign morth_pad = {12'd0,morth};
    
    clock_generation clk_gen 
    (
    		 .clk_in (clk   )
    		,.clk_out(clk_1s)
    );
    
    count_sec sec_count_inst
    (
         .clk    (clk_1s )
    		,.rst_n  (rst_n  )
    		,.set_sec(set_sec)
    		,.sec    (second )
    );
    
    count_minute count_min_inst
    (
    		 .clk    (clk    )
    		,.rst_n  (rst_n  )
    		,.set_min(set_min)
    		,.min    (minute )
    );
    
    count_hour count_hour_inst
    (
    			.clk     (clk     )
    		 ,.rst_n   (rst_n   )
         ,.set_hour(set_hour)
    		 ,.hour    (hour    )
    );
    
    count_day count_day_inst
    (
    			.clk     (clk    )
    		 ,.rst_n   (rst_n  )
    		 ,.set_day (set_day)
    		 ,.day     (day    )
    );
    
    count_morth count_morth_inst
    (
    			.clk      (clk      )
    		 ,.rst_n    (rst_n    )
    		 ,.set_morth(set_morth)
    		 ,.morth    (morth    )
    );
    
    count_year count_year_inst
    (
    			.clk     (clk     )
    		 ,.rst_n   (rst_n   )
    		 ,.set_year(set_year)
    		 ,.year    (year    )
    );
    
    bin2bcd16 #(.DATA_WIDTH(16)) bcd_sec  
    (
    			.CLK   (clk         )  
    		 ,.RST   (rst_n       )
    		 ,.en    (1'b1        )
    		 ,.bin   (second_pad  )
    		 ,.bcd0  (bcd_sec_unit)
    		 ,.bcd1  (bcd_sec_ten )
    		 ,.bcd2  ()
    		 ,.bcd3  ()
    		 ,.bcd4  ()
    );
    bin2bcd16 #(.DATA_WIDTH(16)) bcd_min 
    (
    			.CLK (clk         )
    		 ,.RST (rst_n       )
    		 ,.en  (1'b1        )
    		 ,.bin (minute_pad  )
    		 ,.bcd0(bcd_min_unit)
    		 ,.bcd1(bcd_min_ten )
    		 ,.bcd2()
    		 ,.bcd3()
    		 ,.bcd4()
    );
    
    bin2bcd16 #(.DATA_WIDTH(16)) bcd_hour 
    (
    			.CLK (clk          )
    		 ,.RST (rst_n        )   
    		 ,.en  (1'b1         )
    		 ,.bin (hour_pad     )
    		 ,.bcd0(bcd_hour_unit)
    		 ,.bcd1(bcd_hour_ten )
    		 ,.bcd2()
    		 ,.bcd3()
    		 ,.bcd4()
    );
    
    bin2bcd16 #(.DATA_WIDTH(16)) bcd_day 
    (
    			.CLK (clk           )
    		 ,.RST (rst_n         )
    		 ,.en  (1'b1          )
    		 ,.bin (hour_pad      )
    		 ,.bcd0(bcd_day_unit  )
    		 ,.bcd1(bcd_day_ten   )
    		 ,.bcd2(bcd_day_hunder)
    		 ,.bcd3()
    		 ,.bcd4()
    );
    
    bin2bcd16 #(.DATA_WIDTH(16))  bcd_morth 
    (
    			.CLK (clk           )
    		 ,.RST (rst_n         )
    		 ,.en  (1'b1          )
    		 ,.bin (morth_pad     )
    		 ,.bcd0(bcd_morth_unit)
    		 ,.bcd1(bcd_morth_ten )
    		 ,.bcd2()
    		 ,.bcd3()
    		 ,.bcd4()
    );
    
    bin2bcd16 #(.DATA_WIDTH(16))  bcd_year  
    (
    			.CLK (clk            )
    		 ,.RST (rst_n          )
    		 ,.en  (1'b1           )
    		 ,.bin (year           )
    		 ,.bcd0(bcd_year_unit  )
    		 ,.bcd1(bcd_year_ten   )
    		 ,.bcd2(bcd_year_hunder)
    		 ,.bcd3(bcd_year_thound)
    		 ,.bcd4()
    );
    
    segment7 segment_sec_0 
    ( 
          .bcd(bcd_sec_unit)
         ,.seg(led_sec_unit)
    );
    segment7 segment_sec_1 
    ( 
          .bcd(bcd_sec_ten)
         ,.seg(led_sec_ten)
    );
    segment7 segment_min_0 
    ( 
          .bcd(bcd_min_unit)
         ,.seg(led_min_unit)
    );
    segment7 segment_min_1 
    ( 
          .bcd(bcd_min_ten)
         ,.seg(led_min_ten)
    );
    segment7 segment_hour_0 
    ( 
          .bcd(bcd_hour_unit)
         ,.seg(led_hour_unit)
    );
    segment7 segment_hour_1 
    ( 
          .bcd(bcd_hour_ten)
         ,.seg(led_hour_ten)
    );
    segment7 segment_day_0 
    ( 
          .bcd(bcd_day_unit)
         ,.seg(led_day_unit)
    );
    segment7 segment_day_1 
    ( 
          .bcd(bcd_day_ten)
         ,.seg(led_day_ten)
    );
    segment7 segment_day_2 
    ( 
          .bcd(bcd_day_hunder)
         ,.seg(led_day_hunder)
    );
    segment7 segment_morth_0 
    ( 
          .bcd(bcd_morth_unit)
         ,.seg(led_morth_unit)
    );
    segment7 segment_morth_1 
    ( 
          .bcd(bcd_morth_ten)
         ,.seg(led_morth_ten)
    );
    segment7 segment_year_0 
    ( 
          .bcd(bcd_year_unit)
         ,.seg(led_year_unit)
    );
    segment7 segment_year_1 
    ( 
          .bcd(bcd_year_ten)
         ,.seg(led_year_ten)
    );
    segment7 segment_year_2 
    ( 
          .bcd(bcd_year_hunder)
         ,.seg(led_year_hunder)
    );
    segment7 segment_year_3 
    ( 
          .bcd(bcd_year_thound)
         ,.seg(led_year_thound)
    );











endmodule

