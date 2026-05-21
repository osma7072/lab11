`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: clk_divider
// Description: Generates two divided-down clock enables (tick signals) from
//              the 100 MHz BASYS3 system clock.
//
//              IMPORTANT: These outputs are NOT clocks — they are single
//              1-clock-wide pulses used as synchronous enables. This is the
//              correct FPGA design practice (avoids clock domain issues).
//
//              tick_1hz  : fires once per second   → used to advance seconds
//              tick_1khz : fires 1000 times/second → used to multiplex the
//                          seven-segment displays (prevents visible flicker)
//
//              Math:
//                100,000,000 cycles / 100,000,000 = 1 Hz
//                100,000,000 cycles / 100,000     = 1 kHz
//
// Inputs:
//   clk      - 100 MHz system clock
//   reset    - active-high reset
// Outputs:
//   tick_1hz  - HIGH for 1 clock cycle once per second
//   tick_1khz - HIGH for 1 clock cycle 1000 times per second
//////////////////////////////////////////////////////////////////////////////////

module clk_divider(
    input  clk,
    input  reset,
    output tick_1hz,
    output tick_1khz
);

    // Counter for 1 Hz tick: count from 0 to 99,999,999 then wrap
    parameter ONE_HZ_MAX  = 32'd99_999_999;
    // Counter for 1 kHz tick: count from 0 to 99,999 then wrap
    parameter ONE_KHZ_MAX = 32'd99_999;

    reg [31:0] cnt_1hz;
    reg [16:0] cnt_1khz;    // 17 bits is enough for 99,999

    // ---------------------------------------------------------------
    // 1 Hz counter
    // ---------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset)
            cnt_1hz <= 0;
        else if (cnt_1hz == ONE_HZ_MAX)
            cnt_1hz <= 0;               // wrap back to zero each second
        else
            cnt_1hz <= cnt_1hz + 1;
    end

    // ---------------------------------------------------------------
    // 1 kHz counter
    // ---------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset)
            cnt_1khz <= 0;
        else if (cnt_1khz == ONE_KHZ_MAX)
            cnt_1khz <= 0;
        else
            cnt_1khz <= cnt_1khz + 1;
    end

    // Pulse outputs: HIGH for exactly 1 clock cycle at the rollover point
    assign tick_1hz  = (cnt_1hz  == ONE_HZ_MAX);
    assign tick_1khz = (cnt_1khz == ONE_KHZ_MAX);

endmodule
