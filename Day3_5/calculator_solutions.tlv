// Combinational Calculator
\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   $sum[3:0] = $val1[3:0] + $val2[3:0];
   $diff[3:0] = $val1[3:0] - $val2[3:0];
   $prod[3:0] = $val1[3:0] * $val2[3:0];
   $quot[3:0] = $val1[3:0] / $val2[3:0];
   $out1[3:0] = $sel[0] ? $sum : $diff
   $out2[3:0] = $sel[0] ? $prod : $quot
   $out[3:0] = $sel[1] ? $out1 : $out2
   //...
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule


// Sequential Logic
\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   $sum[3:0] = $val1[3:0] + $val2[3:0];
   $diff[3:0] = $val1[3:0] - $val2[3:0];
   $prod[3:0] = $val1[3:0] * $val2[3:0];
   $quot[3:0] = $val1[3:0] / $val2[3:0];
   $out1[3:0] = $sel[0] ? $sum : $diff;
   $out2[3:0] = $sel[0] ? $prod : $quot;
   $out[3:0] = $sel[1] ? $out1 : $out2;
   $val1 [3:0] = $reset ? 1: (>>1$val1 + >>2$val1);
   //...
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule

