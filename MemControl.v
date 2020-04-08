 // ---------------------------------------------------------------------
//    Module:     Memory Controller
//    Author:     Kevin Hoser and Alex Schendel
//    Contact:    hoser21@up.edu and schendel21@up.edu
//    Date:       2/28/2020
// ---------------------------------------------------------------------

module MemControl(Data_in, Data, rdEn, wrEn, Addr, Ready, clk, Addr_in, RW, Valid);

parameter MEMDEPTH = 256;
parameter DWIDTH = 32;
parameter AWIDTH = 8;

inout Data_in;
inout Data;

output reg rdEn, wrEn;
output reg [AWIDTH-1:0] Addr;
output reg Ready;

// removed reset
input clk;
input [15:0] Addr_in;
input RW;
input Valid;

tri [DWIDTH-1:0] Data_in, Data;

assign Data = (~RW) ? Data_in : {DWIDTH{1'bz}};
assign Data_in = (RW) ? Data : {DWIDTH{1'bz}};

// Commnuication with CPU
// Write operation (RW = 0, Valid = 1)
always @(posedge clk) begin
    if(Valid)
        Ready = 0;
        Addr = Addr_in[AWIDTH-1:0];
        // wait(~clk);
        // wait(clk);
        // wait(~clk);
        // wait(clk);
        // wait(~clk);
        // wait(clk);
        if (~RW)
            //write
            wrEn = 1;
        else
            //read
            rdEn = 1;
        wait(~clk);
        wait(clk);
        Ready = 1;
        rdEn = 0;
        wrEn = 0;
end

endmodule