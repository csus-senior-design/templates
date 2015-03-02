`timescale 1ns / 1ps
`include "template.v"
/*
----------------------------------------
Stereoscopic Vision System
Senior Design Project - Team 11
California State University, Sacramento
Spring 2015 / Fall 2015
----------------------------------------

%MODULE_TITLE%

Authors:  %AUTHOR% (%AUTHOR_EMAIL%)

Description:
  %MODULE_DESCRIPTION%
*/
module template_tb ();
    parameter CLOCKPERIOD = 10;
    
    reg reset;
    reg clock;

    // for counting the cycles    
    reg [15:0] cycle;

    // module, parameters, instance, ports
    template #() template (.clk(clock), .reset(reset));

    // Initial conditions; setup
    initial begin
        $timeformat(-9,1, "ns", 12);
        $monitor("%t, CYCLE: %d", $realtime, cycle);

		// Initial Conditions
        cycle <= 0;
        reset <= 1'b0;

        // Initialize clock
        #5
        clock <= 1'b0;

		// Deassert reset
        #5
        reset <= 1'b1;

        #100 $finish;
    end




/**************************************************************/
/* The following can be left as-is unless necessary to change */
/**************************************************************/

    // Cycle Counter
    always @ (posedge clock)
        cycle <= cycle + 1;

    // Clock generation
    always #(CLOCKPERIOD / 2) clock <= ~clock;

/*
  Conditional Environment Settings for the following:
    - Icarus Verilog
    - VCS
    - Altera Modelsim
    - Xilinx ISIM
*/
// Icarus Verilog
`ifdef IVERILOG
    initial $dumpfile("vcdbasic.vcd");
    initial $dumpvars();
`endif

// VCS
`ifdef VCS
    initial $vcdpluson;
`endif

// Altera Modelsim
`ifdef MODEL_TECH
`endif

// Xilinx ISIM
`ifdef XILINX_ISIM
`endif
endmodule
