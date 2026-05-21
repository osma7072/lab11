`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: display_mux
// Project: ENGR230 BASYS3 Seven Segment Lab
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Cycles through the 4 seven segment digits.
// Only one digit is on at a time, but it refreshes fast enough
// that it looks like all digits are on.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module display_mux(
    input        clk,
    input        reset,
    input        tick_1khz,
    input  [3:0] d0,
    input  [3:0] d1,
    input  [3:0] d2,
    input  [3:0] d3,
    output [6:0] seg,
    output reg [3:0] an,
    output       dp
);

    reg [1:0] digit_sel;
    reg [3:0] current_digit;

    // move to the next digit every 1 kHz tick
    always @(posedge clk or posedge reset) begin
        if (reset)
            digit_sel <= 0;
        else if (tick_1khz)
            digit_sel <= digit_sel + 1;
    end

    // choose which digit is being displayed
    always @(*) begin

        case (digit_sel)

            2'b00: begin
                an = 4'b1110;
                current_digit = d0;
            end

            2'b01: begin
                an = 4'b1101;
                current_digit = d1;
            end

            2'b10: begin
                an = 4'b1011;
                current_digit = d2;
            end

            2'b11: begin
                an = 4'b0111;
                current_digit = d3;
            end

        endcase

    end

    num_to_7segment U_SEG (
        .num(current_digit),
        .seg(seg)
    );

    // decimal point off
    assign dp = 1'b1;

endmodule
