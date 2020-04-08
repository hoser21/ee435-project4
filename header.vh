// ---------------------------------------------------------------------
//    File:       Header file
//    Author:     Kevin Hoser and Alex Schendel
//    Contact:    hoser21@up.edu and schendel21@up.edu
//    Date:       2/28/2020
// ---------------------------------------------------------------------

`ifndef HEADER
`define HEADER

`define DFFE(q, d, en, clk) \
    always @(posedge clk) begin \
        q <= (en) ? d : q; \
    end

`endif