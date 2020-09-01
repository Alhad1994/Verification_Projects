interface smc_intf(input reg qclk,input reg qreset);
    reg         qwrite;
    reg         qsel;
    reg [7]   qaddr;
    reg [16]  qdatain;
    reg [16]  qdataout;
    reg [12]  mnm;
    reg [12]  mnp;

    modport smc_ref_model(input  qclk, input  qreset, input  qwrite,
            input  qsel, input  qaddr, input  qdatain,
            output qdataout, output mnm, output mnp);


endinterface : smc_intf
