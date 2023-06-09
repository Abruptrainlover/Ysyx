// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0

module t;
   initial begin
      // Syntax error, so not checking: if (type(real) == 1)) $stop;  // Bad

      case (type(real))
        1: $stop;  // Bad
        default: $finish;
      endcase

      $write("*-* All Finished *-*\n");
      $finish;
   end

endmodule
