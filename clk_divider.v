`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: clk_divider
// Project: ENGR230 BASYS3 Seven Segment Lab
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Divides the 100 MHz board clock.
// 1 Hz is used for the seconds count.
// 1 kHz is used to refresh the display.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module clk_divider(
    input  clk,
    input  reset,
    output tick_1hz,
    output tick_1khz
);

    parameter ONE_HZ_MAX  = 32'd99_999_999;
    parameter ONE_KHZ_MAX = 32'd99_999;

    reg [31:0] cnt_1hz;
    reg [16:0] cnt_1khz;

    // 1 Hz counter -> one pulse every second
    always @(posedge clk or posedge reset) begin
        if (reset)
            cnt_1hz <= 0;
        else if (cnt_1hz == ONE_HZ_MAX)
            cnt_1hz <= 0;
        else
            cnt_1hz <= cnt_1hz + 1;
    end

    // 1 kHz counter -> display refresh
    always @(posedge clk or posedge reset) begin
        if (reset)
            cnt_1khz <= 0;
        else if (cnt_1khz == ONE_KHZ_MAX)
            cnt_1khz <= 0;
        else
            cnt_1khz <= cnt_1khz + 1;
    end

    assign tick_1hz  = (cnt_1hz == ONE_HZ_MAX);
    assign tick_1khz = (cnt_1khz == ONE_KHZ_MAX);

endmodule
