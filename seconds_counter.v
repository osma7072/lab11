`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: seconds_counter
// Project: ENGR230 BASYS3 Seven Segment Lab
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Counts seconds from 00 to 59.
// Ones digit counts 0-9.
// Tens digit counts 0-5.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module seconds_counter(
    input        clk,
    input        reset,
    input        tick_1hz,
    output reg [3:0] ones,
    output reg [3:0] tens
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            ones <= 0;
            tens <= 0;
        end

        else if (tick_1hz) begin

            // if count is 59, go back to 00
            if ((tens == 5) && (ones == 9)) begin
                ones <= 0;
                tens <= 0;
            end

            // ones rolls over after 9
            else if (ones == 9) begin
                ones <= 0;
                tens <= tens + 1;
            end

            // normal count up
            else begin
                ones <= ones + 1;
            end

        end

    end

endmodule
