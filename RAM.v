 // ---------------------------------------------------------------------
//    Module:     32-bit RAM
//    Author:     Kevin Hoser and Alex Schendel
//    Contact:    hoser21@up.edu and schendel21@up.edu
//    Date:       2/28/2020
// ---------------------------------------------------------------------

`include "HEADER.vh"

module RAM(Data, clk, rdEn, wrEn, Addr);

parameter MEMDEPTH = 256;
parameter DWIDTH = 32;
parameter AWIDTH = 8;

inout [DWIDTH-1:0] Data;
input clk;
input rdEn, wrEn; // active high enable, one-hot
input [AWIDTH-1:0] Addr;

tri [DWIDTH-1:0] Data;
reg [DWIDTH-1:0] dataOut;
reg [DWIDTH-1:0] storage [MEMDEPTH-1:0];

assign Data = (~wrEn) ? dataOut : {DWIDTH{1'bz}};

`DFFE(storage[Addr], Data, wrEn, clk)

// always @(posedge clk) begin
//     if (wrEn)
//         storage[Addr] <= Data;
// end

always @(Addr) begin
    dataOut <= storage[Addr];
end

endmodule~`