// https://makerchip.com/sandbox/0BBfVhQYg/0vghW2o#
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
   |calc
      @1
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         $val1 = >>2$out
         $valid = $reset ? 0 : (>>1$valid + 1);
      @2
         $out1[31:0] = $op[0] ? $sum : $diff;
         $out2[31:0] = $op[0] ? $prod : $quot;
         $out3[31:0] = $op[1] ? $out1 : $out2;
         $out[31:0] = $reset ^ ~$valid ? 32'b0 : $out3;
         
  
         
      
      
   //...
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   //...
