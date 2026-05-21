`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: basys3_sevenseg_lab
// Project: ENGR230 BASYS3 Seven Segment Lab
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Top module for the seven segment lab.
// SW0 selects between Task 1 and Task 2.
//
// SW0 = 0 -> displays 3567
// SW0 = 1 -> displays seconds count from 00 to 59
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module basys3_sevenseg_lab(
    input        clk,
    input        reset,
    input        SW0,
    output [6:0] seg,
    output [3:0] an,
    output       dp
);

    wire tick_1hz;
    wire tick_1khz;

    wire [3:0] sec_ones;
    wire [3:0] sec_tens;

    reg [3:0] d0;
    reg [3:0] d1;
    reg [3:0] d2;
    reg [3:0] d3;

    // make the slow ticks from the 100 MHz board clock
    clk_divider U_CLK (
        .clk(clk),
        .reset(reset),
        .tick_1hz(tick_1hz),
        .tick_1khz(tick_1khz)
    );

    // seconds counter for Task 2
    seconds_counter U_SEC (
        .clk(clk),
        .reset(reset),
        .tick_1hz(tick_1hz),
        .ones(sec_ones),
        .tens(sec_tens)
    );

    // choose what digits go to the display
    always @(*) begin

        if (SW0 == 1'b0) begin
            // Task 1: show 3567
            d3 = 4'd3;    // left digit
            d2 = 4'd5;
            d1 = 4'd6;
            d0 = 4'd7;    // right digit
        end

        else begin
            // Task 2: show seconds as 00-59
            d3 = 4'd15;   // blank
            d2 = 4'd15;   // blank
            d1 = sec_tens;
            d0 = sec_ones;
        end

    end

    // display driver
    display_mux U_DISP (
        .clk(clk),
        .reset(reset),
        .tick_1khz(tick_1khz),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .seg(seg),
        .an(an),
        .dp(dp)
    );

endmodule
