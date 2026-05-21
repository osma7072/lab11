`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: num_to_7segment
// Project: ENGR230 BASYS3 Seven Segment Lab
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Converts a number from 0-9 into the BASYS3 seven segment pattern.
// BASYS3 is active low, so 0 turns a segment on and 1 turns it off.
//
// Segment order used here:
// seg[0] = CA
// seg[1] = CB
// seg[2] = CC
// seg[3] = CD
// seg[4] = CE
// seg[5] = CF
// seg[6] = CG
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module num_to_7segment(
    input  [3:0] num,
    output reg [6:0] seg
);

    always @(*) begin

        case (num)

            //              GFEDCBA
            // These are written for seg[6:0], but match CA-CG correctly.

            4'd0: seg = 7'b1000000; // 0
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            4'd7: seg = 7'b1111000; // 7
            4'd8: seg = 7'b0000000; // 8
            4'd9: seg = 7'b0010000; // 9

            // blank display
            default: seg = 7'b1111111;

        endcase

    end

endmodule
