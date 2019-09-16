-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Jul 30 11:24:31 2019
-- Host        : BF-20160906TGWX running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_isa_0_0_stub.vhdl
-- Design      : design_1_axi_isa_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk_16m_i : in STD_LOGIC;
    oe_isa_sd1 : out STD_LOGIC;
    oe_isa_sd2 : out STD_LOGIC;
    oe_isa_sa1 : out STD_LOGIC;
    oe_isa_sa2 : out STD_LOGIC;
    oe_isa_in : out STD_LOGIC;
    oe_isa_out : out STD_LOGIC;
    dir_isa_sd1 : out STD_LOGIC;
    dir_isa_sd2 : out STD_LOGIC;
    dir_isa_sa1 : out STD_LOGIC;
    dir_isa_sa2 : out STD_LOGIC;
    dir_isa_in : out STD_LOGIC;
    dir_isa_out : out STD_LOGIC;
    isa_sa : out STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_iow : out STD_LOGIC;
    isa_ior : out STD_LOGIC;
    isa_rst_drv : out STD_LOGIC;
    isa_aen : out STD_LOGIC;
    isa_sd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_sd_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_tri_en : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_16m_i,oe_isa_sd1,oe_isa_sd2,oe_isa_sa1,oe_isa_sa2,oe_isa_in,oe_isa_out,dir_isa_sd1,dir_isa_sd2,dir_isa_sa1,dir_isa_sa2,dir_isa_in,dir_isa_out,isa_sa[15:0],isa_iow,isa_ior,isa_rst_drv,isa_aen,isa_sd_in[15:0],isa_sd_out[15:0],isa_tri_en,s00_axi_awaddr[4:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[4:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_isa_v1_0,Vivado 2018.2";
begin
end;
