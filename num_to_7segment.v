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
// Converts a number into seven segment outputs.
// BASYS3 segments are active low, so 0 turns a segment on.
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

            4'd0: seg = 7'b0000001;
            4'd1: seg = 7'b1001111;
            4'd2: seg = 7'b0010010;
            4'd3: seg = 7'b0000110;
            4'd4: seg = 7'b1001100;
            4'd5: seg = 7'b0100100;
            4'd6: seg = 7'b0100000;
            4'd7: seg = 7'b0001111;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0000100;

            // 15 is used as blank
            default: seg = 7'b1111111;

        endcase
    end

endmodule
