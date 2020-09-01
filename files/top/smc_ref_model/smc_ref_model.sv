module smc_ref_model(
input  qclk,
input  qreset,

input  qwrite,
input  qsel,
input  [6:0]  qaddr,
input  [15:0] qdatain,
output logic [15:0] qdataout,

output logic [11:0] mnm,
output logic [11:0] mnp
);

logic [10:0] per;
logic recirc;
logic [1:0] mccc_mcam[11:0];
logic [4:0] mcdc_sign[11:0];
logic [10:0] mcdc_duty[11:0];
logic [1:0] mcpre;
logic mchme;


smc_csr u_smc_csr (
   .smc_csr_rd      ( ~qwrite  ),
   .smc_csr_val     ( qsel     ),
   .smc_csr_addr    ( qaddr    ),
   .smc_csr_wr_data ( qdatain  ),
   .smc_csr_rd_data ( qdataout ),

// SMC_MCPER
   .per         ( per ),

// SMC_MCCTL1
   .recirc      ( recirc ),
   .mctoie      ( ),

// SMC_MCCTL0
   .mcpre       ( mcpre ),
   .mchme       ( mchme ),
   .dith        ( ),
   .mctoif      ( ),

// SMC_MCCC3
   .mccc3_mcom  ( ),
   .mccc3_mcam  ( mccc_mcam[3] ),
   .mccc3_cd    ( ),

// SMC_MCCC2
   .mccc2_mcom  ( ),
   .mccc2_mcam  ( mccc_mcam[2] ),
   .mccc2_cd    ( ),

// SMC_MCCC1
   .mccc1_mcom  ( ),
   .mccc1_mcam  ( mccc_mcam[1] ),
   .mccc1_cd    ( ),

// SMC_MCCC0
   .mccc0_mcom  ( ),
   .mccc0_mcam  ( mccc_mcam[0] ),
   .mccc0_cd    ( ),

// SMC_MCCC7
   .mccc7_mcom  ( ),
   .mccc7_mcam  ( mccc_mcam[7] ),
   .mccc7_cd    ( ),

// SMC_MCCC6
   .mccc6_mcom  ( ),
   .mccc6_mcam  ( mccc_mcam[6] ),
   .mccc6_cd    ( ),

// SMC_MCCC5
   .mccc5_mcom  ( ),
   .mccc5_mcam  ( mccc_mcam[5] ),
   .mccc5_cd    ( ),

// SMC_MCCC4
   .mccc4_mcom  ( ),
   .mccc4_mcam  ( mccc_mcam[4] ),
   .mccc4_cd    ( ),

// SMC_MCCC11
   .mccc11_mcom ( ),
   .mccc11_mcam ( mccc_mcam[11] ),
   .mccc11_cd   ( ),

// SMC_MCCC10
   .mccc10_mcom ( ),
   .mccc10_mcam ( mccc_mcam[10] ),
   .mccc10_cd   ( ),

// SMC_MCCC9
   .mccc9_mcom  ( ),
   .mccc9_mcam  ( mccc_mcam[9] ),
   .mccc9_cd    ( ),

// SMC_MCCC8
   .mccc8_mcom  ( ),
   .mccc8_mcam  ( mccc_mcam[8] ),
   .mccc8_cd    ( ),

// SMC_MCDC1
   .mcdc1_sign  ( mcdc_sign[1] ),
   .mcdc1_duty  ( mcdc_duty[1] ),

// SMC_MCDC0
   .mcdc0_sign  ( mcdc_sign[0] ),
   .mcdc0_duty  ( mcdc_duty[0] ),

// SMC_MCDC3
   .mcdc3_sign  ( mcdc_sign[3] ),
   .mcdc3_duty  ( mcdc_duty[3] ),

// SMC_MCDC2
   .mcdc2_sign  ( mcdc_sign[2] ),
   .mcdc2_duty  ( mcdc_duty[2] ),

// SMC_MCDC5
   .mcdc5_sign  ( mcdc_sign[5] ),
   .mcdc5_duty  ( mcdc_duty[5] ),

// SMC_MCDC4
   .mcdc4_sign  ( mcdc_sign[4] ),
   .mcdc4_duty  ( mcdc_duty[4] ),

// SMC_MCDC7
   .mcdc7_sign  ( mcdc_sign[7] ),
   .mcdc7_duty  ( mcdc_duty[7] ),

// SMC_MCDC6
   .mcdc6_sign  ( mcdc_sign[6] ),
   .mcdc6_duty  ( mcdc_duty[6] ),

// SMC_MCDC9
   .mcdc9_sign  ( mcdc_sign[9] ),
   .mcdc9_duty  ( mcdc_duty[9] ),

// SMC_MCDC8
   .mcdc8_sign  ( mcdc_sign[8] ),
   .mcdc8_duty  ( mcdc_duty[8] ),

// SMC_MCDC11
   .mcdc11_sign ( mcdc_sign[11] ),
   .mcdc11_duty ( mcdc_duty[11] ),

// SMC_MCDC10
   .mcdc10_sign ( mcdc_sign[10] ),
   .mcdc10_duty ( mcdc_duty[10] ),



   .clk             ( qclk    ),
   .rstn            ( ~qreset )

);

logic [13:0] timer_counter;
logic [13:0] last_value_of_timer;
logic [11:0] scaled_timer_counter;
logic        first_pulse;
logic        pwm [11:0];
logic [10:0] nxt_per;
logic [10:0] per_in_use;
logic        first_cycle;
logic [10:0] next_mcdc_duty [11:0];
logic [10:0] mcdc_duty_in_use [11:0];
logic [1:0]  next_mcpre;
logic [1:0]  mcpre_in_use;

assign load = (scaled_timer_counter == (per_in_use-1));

always @(posedge qclk or posedge qreset) begin
   if(qreset)
      nxt_per <= 0;
   else begin
      if(load)
         nxt_per <= per;
   end
end

always @(posedge qclk or posedge qreset) begin
   if(qreset)
      first_cycle <= 1;
   else if(load)
      first_cycle <= 0;
end

assign per_in_use = first_cycle ? per : nxt_per;

always @*
begin
case(mcpre_in_use)
   0: last_value_of_timer = per_in_use-1;
   1: last_value_of_timer = (per_in_use*2)-1;
   2: last_value_of_timer = (per_in_use*4)-1;
   3: last_value_of_timer = (per_in_use*8)-1;
endcase
end

always @(posedge qclk or posedge qreset) begin
   if(qreset)
      timer_counter <= 0;
   else begin
      if(timer_counter == last_value_of_timer)
         timer_counter <= 0;
      else begin
         if(mchme)
            timer_counter <= timer_counter;
         else
            timer_counter <= timer_counter + 1;
      end
   end
end

always @(posedge qclk or posedge qreset) begin
   if(qreset)
      next_mcpre <= 0;
   else begin
      if(load)
         next_mcpre <= mcpre;
   end
end

assign mcpre_in_use = first_cycle ? mcpre : next_mcpre;

always @*
begin
case(mcpre_in_use)
   0: scaled_timer_counter = timer_counter[10:0];
   1: scaled_timer_counter = timer_counter[11:1];
   2: scaled_timer_counter = timer_counter[12:2];
   3: scaled_timer_counter = timer_counter[13:3];
   default: scaled_timer_counter = 11'b0;
endcase
end

always @(posedge qclk or posedge qreset) begin
   if(qreset)
      first_pulse <= 0;
   else begin
      if(scaled_timer_counter == last_value_of_timer)
         first_pulse <= ~first_pulse;
   end
end

genvar i;
generate
for(i=0;i<12;i=i+1) begin: channel_gen
always @(posedge qclk or posedge qreset) begin
   if(qreset)
      next_mcdc_duty[i] <= 0;
   else begin
      if(load)
         next_mcdc_duty[i] <= mcdc_duty[i];
   end
end

assign mcdc_duty_in_use[i] = first_cycle ? mcdc_duty[i] : next_mcdc_duty[i];
always @(posedge qclk or posedge qreset) begin
   if(qreset)
      pwm[i] <= 0;
   else begin
      if(mccc_mcam[i] == 1) begin // Left alligned
         if(scaled_timer_counter < mcdc_duty_in_use[i])
            pwm[i] <= 0;
         else
            pwm[i] <= 1;
      end
      else if(mccc_mcam[i] == 2) begin // Right alligned
         if(scaled_timer_counter < (per_in_use - mcdc_duty_in_use[i]))
            pwm[i] <= 1;
         else
            pwm[i] <= 0;
      end
      else if(mccc_mcam[i] == 3) begin // Center alligned
         if(first_pulse) begin
            if(scaled_timer_counter < mcdc_duty_in_use[i])
               pwm[i] <= 0;
            else
               pwm[i] <= 1;
         end else begin
            if(scaled_timer_counter < (per_in_use - mcdc_duty_in_use[i]))
               pwm[i] <= 1;
            else
               pwm[i] <= 0;
         end
      end
      else
         pwm[i] <= 0; // channel disabled
   end
end

always @*
begin
   case({recirc,mcdc_sign[i][4]})
      2'b00: begin
                mnm[i] = ~pwm[i];
                mnp[i] = 1'b1;
             end
      2'b01: begin
                mnm[i] = 1'b1;
                mnp[i] = ~pwm[i];
             end
      2'b10: begin
                mnm[i] = 1'b0;
                mnp[i] = pwm[i];
             end
      2'b11: begin
                mnm[i] = pwm[i];
                mnp[i] = 1'b0;
             end
   endcase
end
end: channel_gen
endgenerate

endmodule
