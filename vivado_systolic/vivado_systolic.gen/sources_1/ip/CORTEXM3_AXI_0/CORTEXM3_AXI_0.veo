// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: Arm.com:CortexM:CORTEXM3_AXI:1.1
// IP Revision: 38

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
CORTEXM3_AXI_0 your_instance_name (
  .SYSRESETREQ(SYSRESETREQ),    // output wire SYSRESETREQ
  .DBGRESTARTED(DBGRESTARTED),  // output wire DBGRESTARTED
  .LOCKUP(LOCKUP),              // output wire LOCKUP
  .HALTED(HALTED),              // output wire HALTED
  .JTAGNSW(JTAGNSW),            // output wire JTAGNSW
  .JTAGTOP(JTAGTOP),            // output wire JTAGTOP
  .SWDO(SWDO),                  // output wire SWDO
  .SWDOEN(SWDOEN),              // output wire SWDOEN
  .TDO(TDO),                    // output wire TDO
  .nTDOEN(nTDOEN),              // output wire nTDOEN
  .TRCENA(TRCENA),              // output wire TRCENA
  .TRACECLK(TRACECLK),          // output wire TRACECLK
  .TRACEDATA(TRACEDATA),        // output wire [3 : 0] TRACEDATA
  .SWV(SWV),                    // output wire SWV
  .HCLK(HCLK),                  // input wire HCLK
  .SYSRESETn(SYSRESETn),        // input wire SYSRESETn
  .IRQ(IRQ),                    // input wire [15 : 0] IRQ
  .NMI(NMI),                    // input wire NMI
  .CFGITCMEN(CFGITCMEN),        // input wire [1 : 0] CFGITCMEN
  .DBGRESETn(DBGRESETn),        // input wire DBGRESETn
  .DBGRESTART(DBGRESTART),      // input wire DBGRESTART
  .EDBGRQ(EDBGRQ),              // input wire EDBGRQ
  .STCLK(STCLK),                // input wire STCLK// System tick enable
  .SWCLKTCK(SWCLKTCK),          // input wire SWCLKTCK
  .SWDITMS(SWDITMS),            // input wire SWDITMS
  .nTRST(nTRST),                // input wire nTRST
  .TDI(TDI),                    // input wire TDI
  .AWADDRS(AWADDRS),            // output wire [31 : 0] AWADDRS
  .AWLENS(AWLENS),              // output wire [3 : 0] AWLENS
  .AWSIZES(AWSIZES),            // output wire [2 : 0] AWSIZES
  .AWBURSTS(AWBURSTS),          // output wire [1 : 0] AWBURSTS
  .AWLOCKS(AWLOCKS),            // output wire [1 : 0] AWLOCKS
  .AWCACHES(AWCACHES),          // output wire [3 : 0] AWCACHES
  .AWPROTS(AWPROTS),            // output wire [2 : 0] AWPROTS
  .AWUSERS(AWUSERS),            // output wire [0 : 0] AWUSERS
  .AWVALIDS(AWVALIDS),          // output wire AWVALIDS
  .AWREADYS(AWREADYS),          // input wire AWREADYS
  .WSTRBS(WSTRBS),              // output wire [3 : 0] WSTRBS
  .WLASTS(WLASTS),              // output wire WLASTS
  .WVALIDS(WVALIDS),            // output wire WVALIDS
  .WREADYS(WREADYS),            // input wire WREADYS
  .HWDATAS(HWDATAS),            // output wire [31 : 0] HWDATAS
  .BRESPS(BRESPS),              // input wire [1 : 0] BRESPS
  .BVALIDS(BVALIDS),            // input wire BVALIDS
  .BREADYS(BREADYS),            // output wire BREADYS
  .ARADDRS(ARADDRS),            // output wire [31 : 0] ARADDRS
  .ARLENS(ARLENS),              // output wire [3 : 0] ARLENS
  .ARSIZES(ARSIZES),            // output wire [2 : 0] ARSIZES
  .ARBURSTS(ARBURSTS),          // output wire [1 : 0] ARBURSTS
  .ARLOCKS(ARLOCKS),            // output wire [1 : 0] ARLOCKS
  .ARCACHES(ARCACHES),          // output wire [3 : 0] ARCACHES
  .ARPROTS(ARPROTS),            // output wire [2 : 0] ARPROTS
  .ARUSERS(ARUSERS),            // output wire [0 : 0] ARUSERS
  .ARVALIDS(ARVALIDS),          // output wire ARVALIDS
  .ARREADYS(ARREADYS),          // input wire ARREADYS
  .RRESPS(RRESPS),              // input wire [1 : 0] RRESPS
  .RLASTS(RLASTS),              // input wire RLASTS
  .RVALIDS(RVALIDS),            // input wire RVALIDS
  .RREADYS(RREADYS),            // output wire RREADYS
  .HRDATAS(HRDATAS),            // input wire [31 : 0] HRDATAS
  .AWADDRC(AWADDRC),            // output wire [31 : 0] AWADDRC
  .AWLENC(AWLENC),              // output wire [3 : 0] AWLENC
  .AWSIZEC(AWSIZEC),            // output wire [2 : 0] AWSIZEC
  .AWBURSTC(AWBURSTC),          // output wire [1 : 0] AWBURSTC
  .AWLOCKC(AWLOCKC),            // output wire [1 : 0] AWLOCKC
  .AWCACHEC(AWCACHEC),          // output wire [3 : 0] AWCACHEC
  .AWPROTC(AWPROTC),            // output wire [2 : 0] AWPROTC
  .AWUSERC(AWUSERC),            // output wire [0 : 0] AWUSERC
  .AWVALIDC(AWVALIDC),          // output wire AWVALIDC
  .AWREADYC(AWREADYC),          // input wire AWREADYC
  .WSTRBC(WSTRBC),              // output wire [3 : 0] WSTRBC
  .WLASTC(WLASTC),              // output wire WLASTC
  .WVALIDC(WVALIDC),            // output wire WVALIDC
  .WREADYC(WREADYC),            // input wire WREADYC
  .HWDATAC(HWDATAC),            // output wire [31 : 0] HWDATAC
  .BRESPC(BRESPC),              // input wire [1 : 0] BRESPC
  .BVALIDC(BVALIDC),            // input wire BVALIDC
  .BREADYC(BREADYC),            // output wire BREADYC
  .ARADDRC(ARADDRC),            // output wire [31 : 0] ARADDRC
  .ARLENC(ARLENC),              // output wire [3 : 0] ARLENC
  .ARSIZEC(ARSIZEC),            // output wire [2 : 0] ARSIZEC
  .ARBURSTC(ARBURSTC),          // output wire [1 : 0] ARBURSTC
  .ARLOCKC(ARLOCKC),            // output wire [1 : 0] ARLOCKC
  .ARCACHEC(ARCACHEC),          // output wire [3 : 0] ARCACHEC
  .ARPROTC(ARPROTC),            // output wire [2 : 0] ARPROTC
  .ARUSERC(ARUSERC),            // output wire [0 : 0] ARUSERC
  .ARVALIDC(ARVALIDC),          // output wire ARVALIDC
  .ARREADYC(ARREADYC),          // input wire ARREADYC
  .RRESPC(RRESPC),              // input wire [1 : 0] RRESPC
  .RLASTC(RLASTC),              // input wire RLASTC
  .RVALIDC(RVALIDC),            // input wire RVALIDC
  .RREADYC(RREADYC),            // output wire RREADYC
  .HRDATAC(HRDATAC)            // input wire [31 : 0] HRDATAC
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

