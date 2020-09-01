`define FFD 1
`timescale 1ns/1ps
module smc_csr
(

   smc_csr_rd,
   smc_csr_val,
   smc_csr_addr,
   smc_csr_wr_data,
   smc_csr_rd_data,

// SMC_MCPER
   per,

// SMC_MCCTL1
   recirc,
   mctoie,

// SMC_MCCTL0
   mcpre,
   mchme,
   dith,
   mctoif,

// SMC_MCCC3
   mccc3_mcom,
   mccc3_mcam,
   mccc3_cd,

// SMC_MCCC2
   mccc2_mcom,
   mccc2_mcam,
   mccc2_cd,

// SMC_MCCC1
   mccc1_mcom,
   mccc1_mcam,
   mccc1_cd,

// SMC_MCCC0
   mccc0_mcom,
   mccc0_mcam,
   mccc0_cd,

// SMC_MCCC7
   mccc7_mcom,
   mccc7_mcam,
   mccc7_cd,

// SMC_MCCC6
   mccc6_mcom,
   mccc6_mcam,
   mccc6_cd,

// SMC_MCCC5
   mccc5_mcom,
   mccc5_mcam,
   mccc5_cd,

// SMC_MCCC4
   mccc4_mcom,
   mccc4_mcam,
   mccc4_cd,

// SMC_MCCC11
   mccc11_mcom,
   mccc11_mcam,
   mccc11_cd,

// SMC_MCCC10
   mccc10_mcom,
   mccc10_mcam,
   mccc10_cd,

// SMC_MCCC9
   mccc9_mcom,
   mccc9_mcam,
   mccc9_cd,

// SMC_MCCC8
   mccc8_mcom,
   mccc8_mcam,
   mccc8_cd,

// SMC_MCDC1
   mcdc1_sign,
   mcdc1_duty,

// SMC_MCDC0
   mcdc0_sign,
   mcdc0_duty,

// SMC_MCDC3
   mcdc3_sign,
   mcdc3_duty,

// SMC_MCDC2
   mcdc2_sign,
   mcdc2_duty,

// SMC_MCDC5
   mcdc5_sign,
   mcdc5_duty,

// SMC_MCDC4
   mcdc4_sign,
   mcdc4_duty,

// SMC_MCDC7
   mcdc7_sign,
   mcdc7_duty,

// SMC_MCDC6
   mcdc6_sign,
   mcdc6_duty,

// SMC_MCDC9
   mcdc9_sign,
   mcdc9_duty,

// SMC_MCDC8
   mcdc8_sign,
   mcdc8_duty,

// SMC_MCDC11
   mcdc11_sign,
   mcdc11_duty,

// SMC_MCDC10
   mcdc10_sign,
   mcdc10_duty,

   clk,
   rstn
);

input clk;
input rstn;

input smc_csr_rd;
input smc_csr_val;
input [6:0] smc_csr_addr;
input [15:0] smc_csr_wr_data;
output [15:0] smc_csr_rd_data;



// SMC_MCPER
output [10:0] per;

// SMC_MCCTL1
output [0:0] recirc;
output [0:0] mctoie;

// SMC_MCCTL0
output [1:0] mcpre;
output [0:0] mchme;
output [0:0] dith;
output [0:0] mctoif;

// SMC_MCCC3
output [1:0] mccc3_mcom;
output [1:0] mccc3_mcam;
output [1:0] mccc3_cd;

// SMC_MCCC2
output [1:0] mccc2_mcom;
output [1:0] mccc2_mcam;
output [1:0] mccc2_cd;

// SMC_MCCC1
output [1:0] mccc1_mcom;
output [1:0] mccc1_mcam;
output [1:0] mccc1_cd;

// SMC_MCCC0
output [1:0] mccc0_mcom;
output [1:0] mccc0_mcam;
output [1:0] mccc0_cd;

// SMC_MCCC7
output [1:0] mccc7_mcom;
output [1:0] mccc7_mcam;
output [1:0] mccc7_cd;

// SMC_MCCC6
output [1:0] mccc6_mcom;
output [1:0] mccc6_mcam;
output [1:0] mccc6_cd;

// SMC_MCCC5
output [1:0] mccc5_mcom;
output [1:0] mccc5_mcam;
output [1:0] mccc5_cd;

// SMC_MCCC4
output [1:0] mccc4_mcom;
output [1:0] mccc4_mcam;
output [1:0] mccc4_cd;

// SMC_MCCC11
output [1:0] mccc11_mcom;
output [1:0] mccc11_mcam;
output [1:0] mccc11_cd;

// SMC_MCCC10
output [1:0] mccc10_mcom;
output [1:0] mccc10_mcam;
output [1:0] mccc10_cd;

// SMC_MCCC9
output [1:0] mccc9_mcom;
output [1:0] mccc9_mcam;
output [1:0] mccc9_cd;

// SMC_MCCC8
output [1:0] mccc8_mcom;
output [1:0] mccc8_mcam;
output [1:0] mccc8_cd;

// SMC_MCDC1
output [4:0] mcdc1_sign;
output [10:0] mcdc1_duty;

// SMC_MCDC0
output [4:0] mcdc0_sign;
output [10:0] mcdc0_duty;

// SMC_MCDC3
output [4:0] mcdc3_sign;
output [10:0] mcdc3_duty;

// SMC_MCDC2
output [4:0] mcdc2_sign;
output [10:0] mcdc2_duty;

// SMC_MCDC5
output [4:0] mcdc5_sign;
output [10:0] mcdc5_duty;

// SMC_MCDC4
output [4:0] mcdc4_sign;
output [10:0] mcdc4_duty;

// SMC_MCDC7
output [4:0] mcdc7_sign;
output [10:0] mcdc7_duty;

// SMC_MCDC6
output [4:0] mcdc6_sign;
output [10:0] mcdc6_duty;

// SMC_MCDC9
output [4:0] mcdc9_sign;
output [10:0] mcdc9_duty;

// SMC_MCDC8
output [4:0] mcdc8_sign;
output [10:0] mcdc8_duty;

// SMC_MCDC11
output [4:0] mcdc11_sign;
output [10:0] mcdc11_duty;

// SMC_MCDC10
output [4:0] mcdc10_sign;
output [10:0] mcdc10_duty;

`define SMC_MCPER_ADDR       7'h00
`define SMC_MCCTL1_ADDR       7'h02
`define SMC_MCCTL0_ADDR       7'h03
`define SMC_MCCC3_ADDR       7'h10
`define SMC_MCCC2_ADDR       7'h11
`define SMC_MCCC1_ADDR       7'h12
`define SMC_MCCC0_ADDR       7'h13
`define SMC_MCCC7_ADDR       7'h14
`define SMC_MCCC6_ADDR       7'h15
`define SMC_MCCC5_ADDR       7'h16
`define SMC_MCCC4_ADDR       7'h17
`define SMC_MCCC11_ADDR       7'h18
`define SMC_MCCC10_ADDR       7'h19
`define SMC_MCCC9_ADDR       7'h1A
`define SMC_MCCC8_ADDR       7'h1B
`define SMC_MCDC1_ADDR       7'h20
`define SMC_MCDC0_ADDR       7'h22
`define SMC_MCDC3_ADDR       7'h24
`define SMC_MCDC2_ADDR       7'h26
`define SMC_MCDC5_ADDR       7'h28
`define SMC_MCDC4_ADDR       7'h2A
`define SMC_MCDC7_ADDR       7'h2C
`define SMC_MCDC6_ADDR       7'h2E
`define SMC_MCDC9_ADDR       7'h30
`define SMC_MCDC8_ADDR       7'h32
`define SMC_MCDC11_ADDR       7'h34
`define SMC_MCDC10_ADDR       7'h36

`define SMC_MCPER_RST_VAL       16'h0000
`define SMC_MCCTL1_RST_VAL       8'h00
// ERROR
`define SMC_MCCTL0_RST_VAL       8'hFF
`define SMC_MCCC3_RST_VAL       8'h00
`define SMC_MCCC2_RST_VAL       8'h00
`define SMC_MCCC1_RST_VAL       8'h00
`define SMC_MCCC0_RST_VAL       8'h00
`define SMC_MCCC7_RST_VAL       8'h00
`define SMC_MCCC6_RST_VAL       8'h00
`define SMC_MCCC5_RST_VAL       8'h00
`define SMC_MCCC4_RST_VAL       8'h00
`define SMC_MCCC11_RST_VAL       8'h00
`define SMC_MCCC10_RST_VAL       8'h00
`define SMC_MCCC9_RST_VAL       8'h00
`define SMC_MCCC8_RST_VAL       8'h00
`define SMC_MCDC1_RST_VAL       16'h0000
`define SMC_MCDC0_RST_VAL       16'h0000
`define SMC_MCDC3_RST_VAL       16'h0000
`define SMC_MCDC2_RST_VAL       16'h0000
`define SMC_MCDC5_RST_VAL       16'h0000
`define SMC_MCDC4_RST_VAL       16'h0000
`define SMC_MCDC7_RST_VAL       16'h0000
`define SMC_MCDC6_RST_VAL       16'h0000
`define SMC_MCDC9_RST_VAL       16'h0000
`define SMC_MCDC8_RST_VAL       16'h0000
`define SMC_MCDC11_RST_VAL       16'h0000
`define SMC_MCDC10_RST_VAL       16'h0000

reg SMC_MCPER_ctrl;
reg SMC_MCCTL1_ctrl;
reg SMC_MCCTL0_ctrl;
reg SMC_MCCC3_ctrl;
reg SMC_MCCC2_ctrl;
reg SMC_MCCC1_ctrl;
reg SMC_MCCC0_ctrl;
reg SMC_MCCC7_ctrl;
reg SMC_MCCC6_ctrl;
reg SMC_MCCC5_ctrl;
reg SMC_MCCC4_ctrl;
reg SMC_MCCC11_ctrl;
reg SMC_MCCC10_ctrl;
reg SMC_MCCC9_ctrl;
reg SMC_MCCC8_ctrl;
reg SMC_MCDC1_ctrl;
reg SMC_MCDC0_ctrl;
reg SMC_MCDC3_ctrl;
reg SMC_MCDC2_ctrl;
reg SMC_MCDC5_ctrl;
reg SMC_MCDC4_ctrl;
reg SMC_MCDC7_ctrl;
reg SMC_MCDC6_ctrl;
reg SMC_MCDC9_ctrl;
reg SMC_MCDC8_ctrl;
reg SMC_MCDC11_ctrl;
reg SMC_MCDC10_ctrl;
reg [15:0] SMC_MCPER_r;
reg [15:0] SMC_MCCTL1_r;
reg [15:0] SMC_MCCTL0_r;
reg [15:0] SMC_MCCC3_r;
reg [15:0] SMC_MCCC2_r;
reg [15:0] SMC_MCCC1_r;
reg [15:0] SMC_MCCC0_r;
reg [15:0] SMC_MCCC7_r;
reg [15:0] SMC_MCCC6_r;
reg [15:0] SMC_MCCC5_r;
reg [15:0] SMC_MCCC4_r;
reg [15:0] SMC_MCCC11_r;
reg [15:0] SMC_MCCC10_r;
reg [15:0] SMC_MCCC9_r;
reg [15:0] SMC_MCCC8_r;
reg [15:0] SMC_MCDC1_r;
reg [15:0] SMC_MCDC0_r;
reg [15:0] SMC_MCDC3_r;
reg [15:0] SMC_MCDC2_r;
reg [15:0] SMC_MCDC5_r;
reg [15:0] SMC_MCDC4_r;
reg [15:0] SMC_MCDC7_r;
reg [15:0] SMC_MCDC6_r;
reg [15:0] SMC_MCDC9_r;
reg [15:0] SMC_MCDC8_r;
reg [15:0] SMC_MCDC11_r;
reg [15:0] SMC_MCDC10_r;
wire [15:0] SMC_MCPER_rd;
wire [15:0] SMC_MCCTL1_rd;
wire [15:0] SMC_MCCTL0_rd;
wire [15:0] SMC_MCCC3_rd;
wire [15:0] SMC_MCCC2_rd;
wire [15:0] SMC_MCCC1_rd;
wire [15:0] SMC_MCCC0_rd;
wire [15:0] SMC_MCCC7_rd;
wire [15:0] SMC_MCCC6_rd;
wire [15:0] SMC_MCCC5_rd;
wire [15:0] SMC_MCCC4_rd;
wire [15:0] SMC_MCCC11_rd;
wire [15:0] SMC_MCCC10_rd;
wire [15:0] SMC_MCCC9_rd;
wire [15:0] SMC_MCCC8_rd;
wire [15:0] SMC_MCDC1_rd;
wire [15:0] SMC_MCDC0_rd;
wire [15:0] SMC_MCDC3_rd;
wire [15:0] SMC_MCDC2_rd;
wire [15:0] SMC_MCDC5_rd;
wire [15:0] SMC_MCDC4_rd;
wire [15:0] SMC_MCDC7_rd;
wire [15:0] SMC_MCDC6_rd;
wire [15:0] SMC_MCDC9_rd;
wire [15:0] SMC_MCDC8_rd;
wire [15:0] SMC_MCDC11_rd;
wire [15:0] SMC_MCDC10_rd;
wire [26:0] smc_csr_rd_ctrl;
reg [15:0] smc_csr_rd_data_p;
wire [15:0] smc_csr_rd_data;

always @(*) begin
   SMC_MCPER_ctrl = 0;
   SMC_MCCTL1_ctrl = 0;
   SMC_MCCTL0_ctrl = 0;
   SMC_MCCC3_ctrl = 0;
   SMC_MCCC2_ctrl = 0;
   SMC_MCCC1_ctrl = 0;
   SMC_MCCC0_ctrl = 0;
   SMC_MCCC7_ctrl = 0;
   SMC_MCCC6_ctrl = 0;
   SMC_MCCC5_ctrl = 0;
   SMC_MCCC4_ctrl = 0;
   SMC_MCCC11_ctrl = 0;
   SMC_MCCC10_ctrl = 0;
   SMC_MCCC9_ctrl = 0;
   SMC_MCCC8_ctrl = 0;
   SMC_MCDC1_ctrl = 0;
   SMC_MCDC0_ctrl = 0;
   SMC_MCDC3_ctrl = 0;
   SMC_MCDC2_ctrl = 0;
   SMC_MCDC5_ctrl = 0;
   SMC_MCDC4_ctrl = 0;
   SMC_MCDC7_ctrl = 0;
   SMC_MCDC6_ctrl = 0;
   SMC_MCDC9_ctrl = 0;
   SMC_MCDC8_ctrl = 0;
   SMC_MCDC11_ctrl = 0;
   SMC_MCDC10_ctrl = 0;
   if (smc_csr_val) begin
      case(smc_csr_addr)
         `SMC_MCPER_ADDR : SMC_MCPER_ctrl = 1;
         `SMC_MCCTL1_ADDR : SMC_MCCTL1_ctrl = 1;
         `SMC_MCCTL0_ADDR : SMC_MCCTL0_ctrl = 1;
         `SMC_MCCC3_ADDR : SMC_MCCC3_ctrl = 1;
         `SMC_MCCC2_ADDR : SMC_MCCC2_ctrl = 1;
         `SMC_MCCC1_ADDR : SMC_MCCC1_ctrl = 1;
         `SMC_MCCC0_ADDR : SMC_MCCC0_ctrl = 1;
         `SMC_MCCC7_ADDR : SMC_MCCC7_ctrl = 1;
         `SMC_MCCC6_ADDR : SMC_MCCC6_ctrl = 1;
         `SMC_MCCC5_ADDR : SMC_MCCC5_ctrl = 1;
         `SMC_MCCC4_ADDR : SMC_MCCC4_ctrl = 1;
         `SMC_MCCC11_ADDR : SMC_MCCC11_ctrl = 1;
         `SMC_MCCC10_ADDR : SMC_MCCC10_ctrl = 1;
         `SMC_MCCC9_ADDR : SMC_MCCC9_ctrl = 1;
         `SMC_MCCC8_ADDR : SMC_MCCC8_ctrl = 1;
         `SMC_MCDC1_ADDR : SMC_MCDC1_ctrl = 1;
         `SMC_MCDC0_ADDR : SMC_MCDC0_ctrl = 1;
         `SMC_MCDC3_ADDR : SMC_MCDC3_ctrl = 1;
         `SMC_MCDC2_ADDR : SMC_MCDC2_ctrl = 1;
         `SMC_MCDC5_ADDR : SMC_MCDC5_ctrl = 1;
         `SMC_MCDC4_ADDR : SMC_MCDC4_ctrl = 1;
         `SMC_MCDC7_ADDR : SMC_MCDC7_ctrl = 1;
         `SMC_MCDC6_ADDR : SMC_MCDC6_ctrl = 1;
         `SMC_MCDC9_ADDR : SMC_MCDC9_ctrl = 1;
         `SMC_MCDC8_ADDR : SMC_MCDC8_ctrl = 1;
         `SMC_MCDC11_ADDR : SMC_MCDC11_ctrl = 1;
         `SMC_MCDC10_ADDR : SMC_MCDC10_ctrl = 1;
      endcase
   end
end

//////////////////////////////////////////////////////////////////////
// SMC_MCPER

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCPER_r <= #`FFD `SMC_MCPER_RST_VAL;
   end
   else if (SMC_MCPER_ctrl && !smc_csr_rd) begin
      SMC_MCPER_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign per = SMC_MCPER_r[10:0];

// ERROR
assign SMC_MCPER_rd = {
   5'h0,
   SMC_MCPER_r[10],
   1'bx,
   SMC_MCPER_r[9:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCTL1

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCTL1_r <= #`FFD `SMC_MCCTL1_RST_VAL;
   end
   else if (SMC_MCCTL1_ctrl && !smc_csr_rd) begin
      SMC_MCCTL1_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign recirc = SMC_MCCTL1_r[7];
assign mctoie = SMC_MCCTL1_r[0];

// ERROR
assign SMC_MCCTL1_rd = {
   1'b1,
   6'h0,
   1'b0
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCTL0

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCTL0_r <= #`FFD `SMC_MCCTL0_RST_VAL;
   end
   else if (SMC_MCCTL0_ctrl && !smc_csr_rd) begin
      SMC_MCCTL0_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcpre = SMC_MCCTL0_r[6:5];
assign mchme = SMC_MCCTL0_r[4];
assign dith = SMC_MCCTL0_r[2];
assign mctoif = SMC_MCCTL0_r[0];

assign SMC_MCCTL0_rd = {
   1'h0,
   SMC_MCCTL0_r[6:5],
   SMC_MCCTL0_r[4],
   1'h0,
   SMC_MCCTL0_r[2],
   1'h0,
   SMC_MCCTL0_r[0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC3

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC3_r <= #`FFD `SMC_MCCC3_RST_VAL;
   end
   else if (SMC_MCCC3_ctrl && !smc_csr_rd) begin
      SMC_MCCC3_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc3_mcom = SMC_MCCC3_r[7:6];
assign mccc3_mcam = SMC_MCCC3_r[5:4];
assign mccc3_cd = SMC_MCCC3_r[1:0];

assign SMC_MCCC3_rd = {
   SMC_MCCC3_r[7:6],
   SMC_MCCC3_r[5:4],
   2'h0,
   SMC_MCCC3_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC2

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC2_r <= #`FFD `SMC_MCCC2_RST_VAL;
   end
   else if (SMC_MCCC2_ctrl && !smc_csr_rd) begin
      SMC_MCCC2_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc2_mcom = SMC_MCCC2_r[7:6];
assign mccc2_mcam = SMC_MCCC2_r[5:4];
assign mccc2_cd = SMC_MCCC2_r[1:0];

assign SMC_MCCC2_rd = {
   SMC_MCCC2_r[7:6],
   SMC_MCCC2_r[5:4],
   2'h0,
   SMC_MCCC2_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC1

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC1_r <= #`FFD `SMC_MCCC1_RST_VAL;
   end
   else if (SMC_MCCC1_ctrl && !smc_csr_rd) begin
      SMC_MCCC1_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc1_mcom = SMC_MCCC1_r[7:6];
assign mccc1_mcam = SMC_MCCC1_r[5:4];
assign mccc1_cd = SMC_MCCC1_r[1:0];

assign SMC_MCCC1_rd = {
   SMC_MCCC1_r[7:6],
   SMC_MCCC1_r[5:4],
   2'h0,
   SMC_MCCC1_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC0

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC0_r <= #`FFD `SMC_MCCC0_RST_VAL;
   end
   else if (SMC_MCCC0_ctrl && !smc_csr_rd) begin
      SMC_MCCC0_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc0_mcom = SMC_MCCC0_r[7:6];
assign mccc0_mcam = SMC_MCCC0_r[5:4];
assign mccc0_cd = SMC_MCCC0_r[1:0];

assign SMC_MCCC0_rd = {
   SMC_MCCC0_r[7:6],
   SMC_MCCC0_r[5:4],
   2'h0,
   SMC_MCCC0_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC7

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC7_r <= #`FFD `SMC_MCCC7_RST_VAL;
   end
   else if (SMC_MCCC7_ctrl && !smc_csr_rd) begin
      SMC_MCCC7_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc7_mcom = SMC_MCCC7_r[7:6];
assign mccc7_mcam = SMC_MCCC7_r[5:4];
assign mccc7_cd = SMC_MCCC7_r[1:0];

assign SMC_MCCC7_rd = {
   SMC_MCCC7_r[7:6],
   SMC_MCCC7_r[5:4],
   2'h0,
   SMC_MCCC7_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC6

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC6_r <= #`FFD `SMC_MCCC6_RST_VAL;
   end
   else if (SMC_MCCC6_ctrl && !smc_csr_rd) begin
      SMC_MCCC6_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc6_mcom = SMC_MCCC6_r[7:6];
assign mccc6_mcam = SMC_MCCC6_r[5:4];
assign mccc6_cd = SMC_MCCC6_r[1:0];

assign SMC_MCCC6_rd = {
   SMC_MCCC6_r[7:6],
   SMC_MCCC6_r[5:4],
   2'h0,
   SMC_MCCC6_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC5

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC5_r <= #`FFD `SMC_MCCC5_RST_VAL;
   end
   else if (SMC_MCCC5_ctrl && !smc_csr_rd) begin
      SMC_MCCC5_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc5_mcom = SMC_MCCC5_r[7:6];
assign mccc5_mcam = SMC_MCCC5_r[5:4];
assign mccc5_cd = SMC_MCCC5_r[1:0];

assign SMC_MCCC5_rd = {
   SMC_MCCC5_r[7:6],
   SMC_MCCC5_r[5:4],
   2'h0,
   SMC_MCCC5_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC4

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC4_r <= #`FFD `SMC_MCCC4_RST_VAL;
   end
   else if (SMC_MCCC4_ctrl && !smc_csr_rd) begin
      SMC_MCCC4_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc4_mcom = SMC_MCCC4_r[7:6];
assign mccc4_mcam = SMC_MCCC4_r[5:4];
assign mccc4_cd = SMC_MCCC4_r[1:0];

assign SMC_MCCC4_rd = {
   SMC_MCCC4_r[7:6],
   SMC_MCCC4_r[5:4],
   2'h0,
   SMC_MCCC4_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC11

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC11_r <= #`FFD `SMC_MCCC11_RST_VAL;
   end
   else if (SMC_MCCC11_ctrl && !smc_csr_rd) begin
      SMC_MCCC11_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc11_mcom = SMC_MCCC11_r[7:6];
assign mccc11_mcam = SMC_MCCC11_r[5:4];
assign mccc11_cd = SMC_MCCC11_r[1:0];

assign SMC_MCCC11_rd = {
   SMC_MCCC11_r[7:6],
   SMC_MCCC11_r[5:4],
   2'h0,
   SMC_MCCC11_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC10

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC10_r <= #`FFD `SMC_MCCC10_RST_VAL;
   end
   else if (SMC_MCCC10_ctrl && !smc_csr_rd) begin
      SMC_MCCC10_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc10_mcom = SMC_MCCC10_r[7:6];
assign mccc10_mcam = SMC_MCCC10_r[5:4];
assign mccc10_cd = SMC_MCCC10_r[1:0];

assign SMC_MCCC10_rd = {
   SMC_MCCC10_r[7:6],
   SMC_MCCC10_r[5:4],
   2'h0,
   SMC_MCCC10_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC9

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC9_r <= #`FFD `SMC_MCCC9_RST_VAL;
   end
   else if (SMC_MCCC9_ctrl && !smc_csr_rd) begin
      SMC_MCCC9_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc9_mcom = SMC_MCCC9_r[7:6];
assign mccc9_mcam = SMC_MCCC9_r[5:4];
assign mccc9_cd = SMC_MCCC9_r[1:0];

assign SMC_MCCC9_rd = {
   SMC_MCCC9_r[7:6],
   SMC_MCCC9_r[5:4],
   2'h0,
   SMC_MCCC9_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCCC8

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCCC8_r <= #`FFD `SMC_MCCC8_RST_VAL;
   end
   else if (SMC_MCCC8_ctrl && !smc_csr_rd) begin
      SMC_MCCC8_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mccc8_mcom = SMC_MCCC8_r[7:6];
assign mccc8_mcam = SMC_MCCC8_r[5:4];
assign mccc8_cd = SMC_MCCC8_r[1:0];

assign SMC_MCCC8_rd = {
   SMC_MCCC8_r[7:6],
   SMC_MCCC8_r[5:4],
   2'h0,
   SMC_MCCC8_r[1:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC1

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC1_r <= #`FFD `SMC_MCDC1_RST_VAL;
   end
   else if (SMC_MCDC1_ctrl && !smc_csr_rd) begin
      SMC_MCDC1_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc1_sign = SMC_MCDC1_r[15:11];
assign mcdc1_duty = SMC_MCDC1_r[10:0];

assign SMC_MCDC1_rd = {
   SMC_MCDC1_r[15:11],
   SMC_MCDC1_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC0

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC0_r <= #`FFD `SMC_MCDC0_RST_VAL;
   end
   else if (SMC_MCDC0_ctrl && !smc_csr_rd) begin
      SMC_MCDC0_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc0_sign = SMC_MCDC0_r[15:11];
assign mcdc0_duty = SMC_MCDC0_r[10:0];

assign SMC_MCDC0_rd = {
   SMC_MCDC0_r[15:11],
   SMC_MCDC0_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC3

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC3_r <= #`FFD `SMC_MCDC3_RST_VAL;
   end
   else if (SMC_MCDC3_ctrl && !smc_csr_rd) begin
      SMC_MCDC3_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc3_sign = SMC_MCDC3_r[15:11];
assign mcdc3_duty = SMC_MCDC3_r[10:0];

assign SMC_MCDC3_rd = {
   SMC_MCDC3_r[15:11],
   SMC_MCDC3_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC2

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC2_r <= #`FFD `SMC_MCDC2_RST_VAL;
   end
   else if (SMC_MCDC2_ctrl && !smc_csr_rd) begin
      SMC_MCDC2_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc2_sign = SMC_MCDC2_r[15:11];
assign mcdc2_duty = SMC_MCDC2_r[10:0];

assign SMC_MCDC2_rd = {
   SMC_MCDC2_r[15:11],
   SMC_MCDC2_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC5

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC5_r <= #`FFD `SMC_MCDC5_RST_VAL;
   end
   else if (SMC_MCDC5_ctrl && !smc_csr_rd) begin
      SMC_MCDC5_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc5_sign = SMC_MCDC5_r[15:11];
assign mcdc5_duty = SMC_MCDC5_r[10:0];

assign SMC_MCDC5_rd = {
   SMC_MCDC5_r[15:11],
   SMC_MCDC5_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC4

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC4_r <= #`FFD `SMC_MCDC4_RST_VAL;
   end
   else if (SMC_MCDC4_ctrl && !smc_csr_rd) begin
      SMC_MCDC4_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc4_sign = SMC_MCDC4_r[15:11];
assign mcdc4_duty = SMC_MCDC4_r[10:0];

assign SMC_MCDC4_rd = {
   SMC_MCDC4_r[15:11],
   SMC_MCDC4_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC7

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC7_r <= #`FFD `SMC_MCDC7_RST_VAL;
   end
   else if (SMC_MCDC7_ctrl && !smc_csr_rd) begin
      SMC_MCDC7_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc7_sign = SMC_MCDC7_r[15:11];
assign mcdc7_duty = SMC_MCDC7_r[10:0];

assign SMC_MCDC7_rd = {
   SMC_MCDC7_r[15:11],
   SMC_MCDC7_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC6

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC6_r <= #`FFD `SMC_MCDC6_RST_VAL;
   end
   else if (SMC_MCDC6_ctrl && !smc_csr_rd) begin
      SMC_MCDC6_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc6_sign = SMC_MCDC6_r[15:11];
assign mcdc6_duty = SMC_MCDC6_r[10:0];

assign SMC_MCDC6_rd = {
   SMC_MCDC6_r[15:11],
   SMC_MCDC6_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC9

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC9_r <= #`FFD `SMC_MCDC9_RST_VAL;
   end
   else if (SMC_MCDC9_ctrl && !smc_csr_rd) begin
      SMC_MCDC9_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc9_sign = SMC_MCDC9_r[15:11];
assign mcdc9_duty = SMC_MCDC9_r[10:0];

assign SMC_MCDC9_rd = {
   SMC_MCDC9_r[15:11],
   SMC_MCDC9_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC8

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC8_r <= #`FFD `SMC_MCDC8_RST_VAL;
   end
   else if (SMC_MCDC8_ctrl && !smc_csr_rd) begin
      SMC_MCDC8_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc8_sign = SMC_MCDC8_r[15:11];
assign mcdc8_duty = SMC_MCDC8_r[10:0];

assign SMC_MCDC8_rd = {
   SMC_MCDC8_r[15:11],
   SMC_MCDC8_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC11

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC11_r <= #`FFD `SMC_MCDC11_RST_VAL;
   end
   else if (SMC_MCDC11_ctrl && !smc_csr_rd) begin
      SMC_MCDC11_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc11_sign = SMC_MCDC11_r[15:11];
assign mcdc11_duty = SMC_MCDC11_r[10:0];

assign SMC_MCDC11_rd = {
   SMC_MCDC11_r[15:11],
   SMC_MCDC11_r[10:0]
};

//////////////////////////////////////////////////////////////////////
// SMC_MCDC10

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      SMC_MCDC10_r <= #`FFD `SMC_MCDC10_RST_VAL;
   end
   else if (SMC_MCDC10_ctrl && !smc_csr_rd) begin
      SMC_MCDC10_r <= #`FFD smc_csr_wr_data;
   end
   else begin
   end
end

assign mcdc10_sign = SMC_MCDC10_r[15:11];
assign mcdc10_duty = SMC_MCDC10_r[10:0];

assign SMC_MCDC10_rd = {
   SMC_MCDC10_r[15:11],
   SMC_MCDC10_r[10:0]
};

assign smc_csr_rd_ctrl = {
SMC_MCPER_ctrl,
SMC_MCCTL1_ctrl,
SMC_MCCTL0_ctrl,
SMC_MCCC3_ctrl,
SMC_MCCC2_ctrl,
SMC_MCCC1_ctrl,
SMC_MCCC0_ctrl,
SMC_MCCC7_ctrl,
SMC_MCCC6_ctrl,
SMC_MCCC5_ctrl,
SMC_MCCC4_ctrl,
SMC_MCCC11_ctrl,
SMC_MCCC10_ctrl,
SMC_MCCC9_ctrl,
SMC_MCCC8_ctrl,
SMC_MCDC1_ctrl,
SMC_MCDC0_ctrl,
SMC_MCDC3_ctrl,
SMC_MCDC2_ctrl,
SMC_MCDC5_ctrl,
SMC_MCDC4_ctrl,
SMC_MCDC7_ctrl,
SMC_MCDC6_ctrl,
SMC_MCDC9_ctrl,
SMC_MCDC8_ctrl,
SMC_MCDC11_ctrl,
SMC_MCDC10_ctrl
};

always @(*) begin
   smc_csr_rd_data_p = 0;
   case(1'b1)
      smc_csr_rd_ctrl[26] : smc_csr_rd_data_p = SMC_MCPER_rd;
      smc_csr_rd_ctrl[25] : smc_csr_rd_data_p = SMC_MCCTL1_rd;
      smc_csr_rd_ctrl[24] : smc_csr_rd_data_p = SMC_MCCTL0_rd;
      smc_csr_rd_ctrl[23] : smc_csr_rd_data_p = SMC_MCCC3_rd;
      smc_csr_rd_ctrl[22] : smc_csr_rd_data_p = SMC_MCCC2_rd;
      smc_csr_rd_ctrl[21] : smc_csr_rd_data_p = SMC_MCCC1_rd;
      smc_csr_rd_ctrl[20] : smc_csr_rd_data_p = SMC_MCCC0_rd;
      smc_csr_rd_ctrl[19] : smc_csr_rd_data_p = SMC_MCCC7_rd;
      smc_csr_rd_ctrl[18] : smc_csr_rd_data_p = SMC_MCCC6_rd;
      smc_csr_rd_ctrl[17] : smc_csr_rd_data_p = SMC_MCCC5_rd;
      smc_csr_rd_ctrl[16] : smc_csr_rd_data_p = SMC_MCCC4_rd;
      smc_csr_rd_ctrl[15] : smc_csr_rd_data_p = SMC_MCCC11_rd;
      smc_csr_rd_ctrl[14] : smc_csr_rd_data_p = SMC_MCCC10_rd;
      smc_csr_rd_ctrl[13] : smc_csr_rd_data_p = SMC_MCCC9_rd;
      smc_csr_rd_ctrl[12] : smc_csr_rd_data_p = SMC_MCCC8_rd;
      smc_csr_rd_ctrl[11] : smc_csr_rd_data_p = SMC_MCDC1_rd;
      smc_csr_rd_ctrl[10] : smc_csr_rd_data_p = SMC_MCDC0_rd;
      smc_csr_rd_ctrl[9] : smc_csr_rd_data_p = SMC_MCDC3_rd;
      smc_csr_rd_ctrl[8] : smc_csr_rd_data_p = SMC_MCDC2_rd;
      smc_csr_rd_ctrl[7] : smc_csr_rd_data_p = SMC_MCDC5_rd;
      smc_csr_rd_ctrl[6] : smc_csr_rd_data_p = SMC_MCDC4_rd;
      smc_csr_rd_ctrl[5] : smc_csr_rd_data_p = SMC_MCDC7_rd;
      smc_csr_rd_ctrl[4] : smc_csr_rd_data_p = SMC_MCDC6_rd;
      smc_csr_rd_ctrl[3] : smc_csr_rd_data_p = SMC_MCDC9_rd;
      smc_csr_rd_ctrl[2] : smc_csr_rd_data_p = SMC_MCDC8_rd;
      smc_csr_rd_ctrl[1] : smc_csr_rd_data_p = SMC_MCDC11_rd;
      smc_csr_rd_ctrl[0] : smc_csr_rd_data_p = SMC_MCDC10_rd;
   endcase
end

assign smc_csr_rd_data = smc_csr_rd_data_p;

endmodule
