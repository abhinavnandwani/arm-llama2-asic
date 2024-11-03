-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: Arm.com:CortexM:CORTEXM3_AXI:1.1
-- IP Revision: 38

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT CORTEXM3_AXI_0
  PORT (
    SYSRESETREQ : OUT STD_LOGIC;
    DBGRESTARTED : OUT STD_LOGIC;
    LOCKUP : OUT STD_LOGIC;
    HALTED : OUT STD_LOGIC;
    JTAGNSW : OUT STD_LOGIC;
    JTAGTOP : OUT STD_LOGIC;
    SWDO : OUT STD_LOGIC;
    SWDOEN : OUT STD_LOGIC;
    TDO : OUT STD_LOGIC;
    nTDOEN : OUT STD_LOGIC;
    TRCENA : OUT STD_LOGIC;
    TRACECLK : OUT STD_LOGIC;
    TRACEDATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    SWV : OUT STD_LOGIC;
    HCLK : IN STD_LOGIC;
    SYSRESETn : IN STD_LOGIC;
    IRQ : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    NMI : IN STD_LOGIC;
    CFGITCMEN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBGRESETn : IN STD_LOGIC;
    DBGRESTART : IN STD_LOGIC;
    EDBGRQ : IN STD_LOGIC;
    STCLK : IN STD_LOGIC;
    SWCLKTCK : IN STD_LOGIC;
    SWDITMS : IN STD_LOGIC;
    nTRST : IN STD_LOGIC;
    TDI : IN STD_LOGIC;
    AWADDRS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AWLENS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AWSIZES : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AWBURSTS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AWLOCKS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AWCACHES : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AWPROTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AWUSERS : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    AWVALIDS : OUT STD_LOGIC;
    AWREADYS : IN STD_LOGIC;
    WSTRBS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    WLASTS : OUT STD_LOGIC;
    WVALIDS : OUT STD_LOGIC;
    WREADYS : IN STD_LOGIC;
    HWDATAS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    BRESPS : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    BVALIDS : IN STD_LOGIC;
    BREADYS : OUT STD_LOGIC;
    ARADDRS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ARLENS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ARSIZES : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ARBURSTS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ARLOCKS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ARCACHES : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ARPROTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ARUSERS : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ARVALIDS : OUT STD_LOGIC;
    ARREADYS : IN STD_LOGIC;
    RRESPS : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    RLASTS : IN STD_LOGIC;
    RVALIDS : IN STD_LOGIC;
    RREADYS : OUT STD_LOGIC;
    HRDATAS : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AWADDRC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AWLENC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AWSIZEC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AWBURSTC : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AWLOCKC : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AWCACHEC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AWPROTC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AWUSERC : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    AWVALIDC : OUT STD_LOGIC;
    AWREADYC : IN STD_LOGIC;
    WSTRBC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    WLASTC : OUT STD_LOGIC;
    WVALIDC : OUT STD_LOGIC;
    WREADYC : IN STD_LOGIC;
    HWDATAC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    BRESPC : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    BVALIDC : IN STD_LOGIC;
    BREADYC : OUT STD_LOGIC;
    ARADDRC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ARLENC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ARSIZEC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ARBURSTC : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ARLOCKC : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ARCACHEC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ARPROTC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ARUSERC : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ARVALIDC : OUT STD_LOGIC;
    ARREADYC : IN STD_LOGIC;
    RRESPC : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    RLASTC : IN STD_LOGIC;
    RVALIDC : IN STD_LOGIC;
    RREADYC : OUT STD_LOGIC;
    HRDATAC : IN STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : CORTEXM3_AXI_0
  PORT MAP (
    SYSRESETREQ => SYSRESETREQ,
    DBGRESTARTED => DBGRESTARTED,
    LOCKUP => LOCKUP,
    HALTED => HALTED,
    JTAGNSW => JTAGNSW,
    JTAGTOP => JTAGTOP,
    SWDO => SWDO,
    SWDOEN => SWDOEN,
    TDO => TDO,
    nTDOEN => nTDOEN,
    TRCENA => TRCENA,
    TRACECLK => TRACECLK,
    TRACEDATA => TRACEDATA,
    SWV => SWV,
    HCLK => HCLK,
    SYSRESETn => SYSRESETn,
    IRQ => IRQ,
    NMI => NMI,
    CFGITCMEN => CFGITCMEN,
    DBGRESETn => DBGRESETn,
    DBGRESTART => DBGRESTART,
    EDBGRQ => EDBGRQ,
    STCLK => STCLK,
    SWCLKTCK => SWCLKTCK,
    SWDITMS => SWDITMS,
    nTRST => nTRST,
    TDI => TDI,
    AWADDRS => AWADDRS,
    AWLENS => AWLENS,
    AWSIZES => AWSIZES,
    AWBURSTS => AWBURSTS,
    AWLOCKS => AWLOCKS,
    AWCACHES => AWCACHES,
    AWPROTS => AWPROTS,
    AWUSERS => AWUSERS,
    AWVALIDS => AWVALIDS,
    AWREADYS => AWREADYS,
    WSTRBS => WSTRBS,
    WLASTS => WLASTS,
    WVALIDS => WVALIDS,
    WREADYS => WREADYS,
    HWDATAS => HWDATAS,
    BRESPS => BRESPS,
    BVALIDS => BVALIDS,
    BREADYS => BREADYS,
    ARADDRS => ARADDRS,
    ARLENS => ARLENS,
    ARSIZES => ARSIZES,
    ARBURSTS => ARBURSTS,
    ARLOCKS => ARLOCKS,
    ARCACHES => ARCACHES,
    ARPROTS => ARPROTS,
    ARUSERS => ARUSERS,
    ARVALIDS => ARVALIDS,
    ARREADYS => ARREADYS,
    RRESPS => RRESPS,
    RLASTS => RLASTS,
    RVALIDS => RVALIDS,
    RREADYS => RREADYS,
    HRDATAS => HRDATAS,
    AWADDRC => AWADDRC,
    AWLENC => AWLENC,
    AWSIZEC => AWSIZEC,
    AWBURSTC => AWBURSTC,
    AWLOCKC => AWLOCKC,
    AWCACHEC => AWCACHEC,
    AWPROTC => AWPROTC,
    AWUSERC => AWUSERC,
    AWVALIDC => AWVALIDC,
    AWREADYC => AWREADYC,
    WSTRBC => WSTRBC,
    WLASTC => WLASTC,
    WVALIDC => WVALIDC,
    WREADYC => WREADYC,
    HWDATAC => HWDATAC,
    BRESPC => BRESPC,
    BVALIDC => BVALIDC,
    BREADYC => BREADYC,
    ARADDRC => ARADDRC,
    ARLENC => ARLENC,
    ARSIZEC => ARSIZEC,
    ARBURSTC => ARBURSTC,
    ARLOCKC => ARLOCKC,
    ARCACHEC => ARCACHEC,
    ARPROTC => ARPROTC,
    ARUSERC => ARUSERC,
    ARVALIDC => ARVALIDC,
    ARREADYC => ARREADYC,
    RRESPC => RRESPC,
    RLASTC => RLASTC,
    RVALIDC => RVALIDC,
    RREADYC => RREADYC,
    HRDATAC => HRDATAC
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file CORTEXM3_AXI_0.vhd when simulating
-- the core, CORTEXM3_AXI_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



