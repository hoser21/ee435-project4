// ---------------------------------------------------------------------
//    Module:     32-bit ALU TB
//    Author:     Kevin Hoser and Alex Schendel
//    Contact:    hoser21@up.edu and schendel21@up.edu
//    Date:       02/28/2019
// ---------------------------------------------------------------------

`timescale 1ns / 1ns

module ALU_tb();
  
wire [31:0] out;
reg [31:0] a, b;
reg [3:0] op;

ALU dut(out, a, b, op); 
  
initial	// Test stimulus
  begin
    #10  a = 32'hBC157222; b =  32'h222751CB; op = 4'h0;
    #10  a = 32'h00000000; b =  32'h583bd1cc; op = 4'h1;
    #10  a = 32'h10101010; b =  32'h583bd1cc; op = 4'h8;
    #10  a = 32'h0189ABCD; b =  32'h1DC74A54; op = 4'h9;
    #10  a = 32'he9eec208; b =  32'h583bd1cc; op = 4'hA;
    #10  a = 32'h1fbc8148; b =  32'h20ce01ee; op = 4'hB;
    #10  a = 32'h2416e099; b =  32'h3ef9d5ec; op = 4'h2;
    #10  a = 32'h687f3b5a; b =  32'h71252c6f; op = 4'h3;
    #10  a = 32'h555984ab; b =  32'h6c886316; op = 4'h4;
    #10  a = 32'hFFFEFFFF; b =  32'h00000004; op = 4'hC;
    #10  a = 32'hFFFF7FFF; b =  32'h00000009; op = 4'hD;
    #10  a = 32'h80000000; b =  32'h0000001E; op = 4'hE;
    #10  a = 32'h23337af9; b =  32'h89bfe491; op = 4'hF;
    #10 $stop;
  end

endmodule
