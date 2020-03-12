// -------------------------------------------------------------
// 

// File Name: C:\Users\Bo\OneDrive - HKUST Connect\Bit depth compression\FPGA Implementation\Final\temp\codegen\compression_hdl_lowpower\hdlsrc\SimpleDualPortRAM_generic.v
// Created: 2018-07-17 12:56:27
// 
// Generated by MATLAB 9.1, MATLAB Coder 3.2 and HDL Coder 3.9
// 
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SimpleDualPortRAM_generic
// Source Path: compression_hdl_lowpower/ShiftRegisterRAM_generic/SimpleDualPortRAM_generic
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SimpleDualPortRAM_generic
          (
           clk,
           enb,
           wr_din,
           wr_addr,
           wr_en,
           rd_addr,
           rd_dout
          );


  parameter AddrWidth = 1;
  parameter DataWidth = 1;

  input   clk;
  input   enb;
  input   [DataWidth - 1:0] wr_din;  // parameterized width
  input   [AddrWidth - 1:0] wr_addr;  // parameterized width
  input   wr_en;  // ufix1
  input   [AddrWidth - 1:0] rd_addr;  // parameterized width
  output  [DataWidth - 1:0] rd_dout;  // parameterized width

  reg  [DataWidth - 1:0] ram [2**AddrWidth - 1:0];
  reg  [DataWidth - 1:0] data_int;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    data_int = 0;
  end


  always @(posedge clk)
    begin : SimpleDualPortRAM_generic_process
      if (enb == 1'b1) begin
        if (wr_en == 1'b1) begin
          ram[wr_addr] <= wr_din;
        end
        data_int <= ram[rd_addr];
      end
    end

  assign rd_dout = data_int;

endmodule  // SimpleDualPortRAM_generic

