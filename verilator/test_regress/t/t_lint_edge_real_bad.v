// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0

module t (/*AUTOARG*/
   // Inputs
   rbad, rok
   );
   input real rbad;
   input real rok;
   event ebad;
   struct packed { int a; } sok;

   always @ (rok) $stop;
   always @ (sok) $stop;

   always @ (posedge rbad) $stop;
   always @ (posedge ebad) $stop;

endmodule
