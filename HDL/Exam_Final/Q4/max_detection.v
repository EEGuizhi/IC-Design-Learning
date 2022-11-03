module max_detection(clk,start, din, length);
input	clk;			/* rising edge triggered */
input	start;			/* becomes 1 for 1 clock cycle long at the negative edge of the clock */
input	din;			/* data input port, changes at the negative edges of the clock, and sampled by
                           the detector at the positive edges of the clock */
output	[4:0] length;	/*data output port */
reg		[4:0] length;
