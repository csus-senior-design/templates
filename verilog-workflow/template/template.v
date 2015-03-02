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
module template(clk, reset);
    input clk;          // Clock signal
    input reset;        // Reset signal (active-low)

    always @ (posedge clk or negedge reset) begin
        if (~reset) begin
			// Reset logic
        end
        else begin
	    	// Clocked logic
        end
    end
endmodule
