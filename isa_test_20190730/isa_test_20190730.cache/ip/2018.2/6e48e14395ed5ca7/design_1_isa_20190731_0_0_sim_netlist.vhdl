-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Jul 31 16:11:44 2019
-- Host        : BF-20160906TGWX running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_isa_20190731_0_0_sim_netlist.vhdl
-- Design      : design_1_isa_20190731_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ISA_Controller is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    oe_isa_sd1 : out STD_LOGIC;
    dir_isa_sd1 : out STD_LOGIC;
    isa_iow : out STD_LOGIC;
    isa_ior : out STD_LOGIC;
    \axi_rdata_reg[4]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 14 downto 0 );
    \current_state_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    isa_tri_en : out STD_LOGIC;
    isa_sa : out STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_sd_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_16m_i : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    sel0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \slv_reg3_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \slv_reg1_reg[0]\ : in STD_LOGIC;
    \slv_reg1_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_current_state_reg[0]_0\ : in STD_LOGIC;
    \slv_reg2_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    isa_sd_in : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ISA_Controller;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ISA_Controller is
  signal \FSM_sequential_current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \current_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \^current_state_reg[0]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^dir_isa_sd1\ : STD_LOGIC;
  signal dir_isa_sd1_i_1_n_0 : STD_LOGIC;
  signal isa_ctl_cnt : STD_LOGIC;
  signal \isa_ctl_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \isa_ctl_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \isa_ctl_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \isa_ctl_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \isa_ctl_cnt[3]_i_3_n_0\ : STD_LOGIC;
  signal \isa_ctl_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \isa_ctl_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \isa_ctl_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \isa_ctl_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \^isa_ior\ : STD_LOGIC;
  signal isa_ior_i_1_n_0 : STD_LOGIC;
  signal \^isa_iow\ : STD_LOGIC;
  signal isa_iow_i_1_n_0 : STD_LOGIC;
  signal isa_iow_i_2_n_0 : STD_LOGIC;
  signal isa_iow_i_3_n_0 : STD_LOGIC;
  signal isa_rd_done : STD_LOGIC;
  signal isa_rd_done_i_1_n_0 : STD_LOGIC;
  signal isa_rd_done_i_2_n_0 : STD_LOGIC;
  signal \isa_sa[0]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[10]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[11]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[12]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[13]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[14]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[15]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[15]_i_2_n_0\ : STD_LOGIC;
  signal \isa_sa[1]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[2]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[3]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[4]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[5]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[6]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[7]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[8]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sa[9]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[0]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[10]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[11]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[12]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[13]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[14]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[15]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[15]_i_2_n_0\ : STD_LOGIC;
  signal \isa_sd_out[1]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[2]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[3]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[4]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[5]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[6]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[7]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[8]_i_1_n_0\ : STD_LOGIC;
  signal \isa_sd_out[9]_i_1_n_0\ : STD_LOGIC;
  signal isa_wr_done : STD_LOGIC;
  signal isa_wr_done_i_1_n_0 : STD_LOGIC;
  signal isa_wr_done_i_2_n_0 : STD_LOGIC;
  signal isa_wr_done_i_3_n_0 : STD_LOGIC;
  signal \^oe_isa_sd1\ : STD_LOGIC;
  signal oe_isa_sd1_i_1_n_0 : STD_LOGIC;
  signal oe_isa_sd1_i_3_n_0 : STD_LOGIC;
  signal oe_isa_sd1_i_4_n_0 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal slave_isa_rd_data : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \slave_isa_rd_data[15]_i_1_n_0\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "ISA_WRITE:10,ISA_READ:00,IDLE:01";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_current_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "ISA_WRITE:10,ISA_READ:00,IDLE:01";
  attribute KEEP of \FSM_sequential_current_state_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of isa_wr_done_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of oe_isa_sd1_i_3 : label is "soft_lutpair0";
begin
  \current_state_reg[0]_0\(1 downto 0) <= \^current_state_reg[0]_0\(1 downto 0);
  dir_isa_sd1 <= \^dir_isa_sd1\;
  isa_ior <= \^isa_ior\;
  isa_iow <= \^isa_iow\;
  oe_isa_sd1 <= \^oe_isa_sd1\;
  \out\(1 downto 0) <= \^out\(1 downto 0);
\FSM_sequential_current_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      O => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \FSM_sequential_current_state[1]_i_1_n_0\,
      D => D(0),
      PRE => SR(0),
      Q => \^out\(0)
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \FSM_sequential_current_state[1]_i_1_n_0\,
      CLR => SR(0),
      D => D(1),
      Q => \^out\(1)
    );
\axi_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0015FFFF00150000"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[2]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[3]\,
      I4 => sel0(0),
      I5 => slave_isa_rd_data(4),
      O => \axi_rdata_reg[4]\
    );
\current_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F454"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg1_reg[0]\,
      I2 => \^current_state_reg[0]_0\(0),
      I3 => \slv_reg1_reg[0]_0\,
      I4 => \^current_state_reg[0]_0\(1),
      O => \current_state[0]_i_1_n_0\
    );
\current_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EFE0"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg1_reg[0]_0\,
      I2 => \^current_state_reg[0]_0\(1),
      I3 => \FSM_sequential_current_state_reg[0]_0\,
      I4 => \^current_state_reg[0]_0\(0),
      O => \current_state[1]_i_1_n_0\
    );
\current_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \FSM_sequential_current_state[1]_i_1_n_0\,
      CLR => SR(0),
      D => \current_state[0]_i_1_n_0\,
      Q => \^current_state_reg[0]_0\(0)
    );
\current_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \FSM_sequential_current_state[1]_i_1_n_0\,
      CLR => SR(0),
      D => \current_state[1]_i_1_n_0\,
      Q => \^current_state_reg[0]_0\(1)
    );
dir_isa_sd1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFEF00"
    )
        port map (
      I0 => \^out\(0),
      I1 => oe_isa_sd1_i_3_n_0,
      I2 => \^out\(1),
      I3 => oe_isa_sd1_i_4_n_0,
      I4 => \^dir_isa_sd1\,
      O => dir_isa_sd1_i_1_n_0
    );
dir_isa_sd1_reg: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => '1',
      D => dir_isa_sd1_i_1_n_0,
      PRE => SR(0),
      Q => \^dir_isa_sd1\
    );
\isa_ctl_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"23"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[0]\,
      I2 => \^out\(0),
      O => \isa_ctl_cnt[0]_i_1_n_0\
    );
\isa_ctl_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"283C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[0]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \^out\(0),
      O => \isa_ctl_cnt[1]_i_1_n_0\
    );
\isa_ctl_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28883CCC"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[2]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[0]\,
      I4 => \^out\(0),
      O => \isa_ctl_cnt[2]_i_1_n_0\
    );
\isa_ctl_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555550CCCCCCC"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt[3]_i_3_n_0\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[0]\,
      I4 => \isa_ctl_cnt_reg_n_0_[2]\,
      I5 => \^out\(0),
      O => isa_ctl_cnt
    );
\isa_ctl_cnt[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"288888883CCCCCCC"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[0]\,
      I4 => \isa_ctl_cnt_reg_n_0_[2]\,
      I5 => \^out\(0),
      O => \isa_ctl_cnt[3]_i_2_n_0\
    );
\isa_ctl_cnt[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => isa_rd_done,
      I1 => isa_wr_done,
      I2 => \isa_ctl_cnt_reg_n_0_[3]\,
      O => \isa_ctl_cnt[3]_i_3_n_0\
    );
\isa_ctl_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => isa_ctl_cnt,
      CLR => SR(0),
      D => \isa_ctl_cnt[0]_i_1_n_0\,
      Q => \isa_ctl_cnt_reg_n_0_[0]\
    );
\isa_ctl_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => isa_ctl_cnt,
      CLR => SR(0),
      D => \isa_ctl_cnt[1]_i_1_n_0\,
      Q => \isa_ctl_cnt_reg_n_0_[1]\
    );
\isa_ctl_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => isa_ctl_cnt,
      CLR => SR(0),
      D => \isa_ctl_cnt[2]_i_1_n_0\,
      Q => \isa_ctl_cnt_reg_n_0_[2]\
    );
\isa_ctl_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => isa_ctl_cnt,
      CLR => SR(0),
      D => \isa_ctl_cnt[3]_i_2_n_0\,
      Q => \isa_ctl_cnt_reg_n_0_[3]\
    );
isa_ior_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FCC5FFF50CC5000"
    )
        port map (
      I0 => \^out\(0),
      I1 => isa_iow_i_2_n_0,
      I2 => isa_iow_i_3_n_0,
      I3 => \^out\(1),
      I4 => oe_isa_sd1_i_4_n_0,
      I5 => \^isa_ior\,
      O => isa_ior_i_1_n_0
    );
isa_ior_reg: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => '1',
      D => isa_ior_i_1_n_0,
      PRE => SR(0),
      Q => \^isa_ior\
    );
isa_iow_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFBF8F80"
    )
        port map (
      I0 => isa_iow_i_2_n_0,
      I1 => oe_isa_sd1_i_4_n_0,
      I2 => \^out\(1),
      I3 => isa_iow_i_3_n_0,
      I4 => \^isa_iow\,
      O => isa_iow_i_1_n_0
    );
isa_iow_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFCFD"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[0]\,
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[2]\,
      I3 => \isa_ctl_cnt_reg_n_0_[1]\,
      I4 => \^out\(0),
      O => isa_iow_i_2_n_0
    );
isa_iow_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEAAA"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[3]\,
      I1 => \isa_ctl_cnt_reg_n_0_[1]\,
      I2 => \isa_ctl_cnt_reg_n_0_[0]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \^out\(0),
      O => isa_iow_i_3_n_0
    );
isa_iow_reg: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => '1',
      D => isa_iow_i_1_n_0,
      PRE => SR(0),
      Q => \^isa_iow\
    );
isa_rd_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFF00010000"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[0]\,
      I3 => \^out\(1),
      I4 => isa_rd_done_i_2_n_0,
      I5 => isa_rd_done,
      O => isa_rd_done_i_1_n_0
    );
isa_rd_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33333333FBF0F0F0"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[0]\,
      I1 => \^out\(1),
      I2 => \isa_ctl_cnt_reg_n_0_[3]\,
      I3 => \isa_ctl_cnt_reg_n_0_[1]\,
      I4 => \isa_ctl_cnt_reg_n_0_[2]\,
      I5 => \^out\(0),
      O => isa_rd_done_i_2_n_0
    );
isa_rd_done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => '1',
      CLR => SR(0),
      D => isa_rd_done_i_1_n_0,
      Q => isa_rd_done
    );
\isa_sa[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(0),
      I2 => \^out\(0),
      O => \isa_sa[0]_i_1_n_0\
    );
\isa_sa[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(10),
      I2 => \^out\(0),
      O => \isa_sa[10]_i_1_n_0\
    );
\isa_sa[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(11),
      I2 => \^out\(0),
      O => \isa_sa[11]_i_1_n_0\
    );
\isa_sa[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(12),
      I2 => \^out\(0),
      O => \isa_sa[12]_i_1_n_0\
    );
\isa_sa[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(13),
      I2 => \^out\(0),
      O => \isa_sa[13]_i_1_n_0\
    );
\isa_sa[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(14),
      I2 => \^out\(0),
      O => \isa_sa[14]_i_1_n_0\
    );
\isa_sa[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55550333"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \^out\(0),
      O => \isa_sa[15]_i_1_n_0\
    );
\isa_sa[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(15),
      I2 => \^out\(0),
      O => \isa_sa[15]_i_2_n_0\
    );
\isa_sa[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(1),
      I2 => \^out\(0),
      O => \isa_sa[1]_i_1_n_0\
    );
\isa_sa[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(2),
      I2 => \^out\(0),
      O => \isa_sa[2]_i_1_n_0\
    );
\isa_sa[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(3),
      I2 => \^out\(0),
      O => \isa_sa[3]_i_1_n_0\
    );
\isa_sa[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(4),
      I2 => \^out\(0),
      O => \isa_sa[4]_i_1_n_0\
    );
\isa_sa[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(5),
      I2 => \^out\(0),
      O => \isa_sa[5]_i_1_n_0\
    );
\isa_sa[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(6),
      I2 => \^out\(0),
      O => \isa_sa[6]_i_1_n_0\
    );
\isa_sa[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(7),
      I2 => \^out\(0),
      O => \isa_sa[7]_i_1_n_0\
    );
\isa_sa[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(8),
      I2 => \^out\(0),
      O => \isa_sa[8]_i_1_n_0\
    );
\isa_sa[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \^out\(1),
      I1 => \slv_reg2_reg[15]\(9),
      I2 => \^out\(0),
      O => \isa_sa[9]_i_1_n_0\
    );
\isa_sa_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[0]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(0)
    );
\isa_sa_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[10]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(10)
    );
\isa_sa_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[11]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(11)
    );
\isa_sa_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[12]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(12)
    );
\isa_sa_reg[13]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[13]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(13)
    );
\isa_sa_reg[14]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[14]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(14)
    );
\isa_sa_reg[15]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[15]_i_2_n_0\,
      PRE => SR(0),
      Q => isa_sa(15)
    );
\isa_sa_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[1]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(1)
    );
\isa_sa_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[2]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(2)
    );
\isa_sa_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[3]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(3)
    );
\isa_sa_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[4]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(4)
    );
\isa_sa_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[5]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(5)
    );
\isa_sa_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[6]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(6)
    );
\isa_sa_reg[7]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[7]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(7)
    );
\isa_sa_reg[8]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[8]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(8)
    );
\isa_sa_reg[9]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sa[15]_i_1_n_0\,
      D => \isa_sa[9]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sa(9)
    );
\isa_sd_out[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(0),
      I5 => \^out\(1),
      O => \isa_sd_out[0]_i_1_n_0\
    );
\isa_sd_out[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(10),
      I5 => \^out\(1),
      O => \isa_sd_out[10]_i_1_n_0\
    );
\isa_sd_out[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(11),
      I5 => \^out\(1),
      O => \isa_sd_out[11]_i_1_n_0\
    );
\isa_sd_out[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(12),
      I5 => \^out\(1),
      O => \isa_sd_out[12]_i_1_n_0\
    );
\isa_sd_out[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(13),
      I5 => \^out\(1),
      O => \isa_sd_out[13]_i_1_n_0\
    );
\isa_sd_out[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(14),
      I5 => \^out\(1),
      O => \isa_sd_out[14]_i_1_n_0\
    );
\isa_sd_out[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555FECEEEEE"
    )
        port map (
      I0 => \^out\(1),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[0]\,
      I4 => \isa_ctl_cnt_reg_n_0_[2]\,
      I5 => \^out\(0),
      O => \isa_sd_out[15]_i_1_n_0\
    );
\isa_sd_out[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(15),
      I5 => \^out\(1),
      O => \isa_sd_out[15]_i_2_n_0\
    );
\isa_sd_out[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(1),
      I5 => \^out\(1),
      O => \isa_sd_out[1]_i_1_n_0\
    );
\isa_sd_out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(2),
      I5 => \^out\(1),
      O => \isa_sd_out[2]_i_1_n_0\
    );
\isa_sd_out[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(3),
      I5 => \^out\(1),
      O => \isa_sd_out[3]_i_1_n_0\
    );
\isa_sd_out[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(4),
      I5 => \^out\(1),
      O => \isa_sd_out[4]_i_1_n_0\
    );
\isa_sd_out[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(5),
      I5 => \^out\(1),
      O => \isa_sd_out[5]_i_1_n_0\
    );
\isa_sd_out[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(6),
      I5 => \^out\(1),
      O => \isa_sd_out[6]_i_1_n_0\
    );
\isa_sd_out[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(7),
      I5 => \^out\(1),
      O => \isa_sd_out[7]_i_1_n_0\
    );
\isa_sd_out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(8),
      I5 => \^out\(1),
      O => \isa_sd_out[8]_i_1_n_0\
    );
\isa_sd_out[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \isa_ctl_cnt_reg_n_0_[1]\,
      I3 => \isa_ctl_cnt_reg_n_0_[2]\,
      I4 => \slv_reg3_reg[15]\(9),
      I5 => \^out\(1),
      O => \isa_sd_out[9]_i_1_n_0\
    );
\isa_sd_out_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[0]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(0)
    );
\isa_sd_out_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[10]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(10)
    );
\isa_sd_out_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[11]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(11)
    );
\isa_sd_out_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[12]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(12)
    );
\isa_sd_out_reg[13]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[13]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(13)
    );
\isa_sd_out_reg[14]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[14]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(14)
    );
\isa_sd_out_reg[15]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[15]_i_2_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(15)
    );
\isa_sd_out_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[1]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(1)
    );
\isa_sd_out_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[2]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(2)
    );
\isa_sd_out_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[3]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(3)
    );
\isa_sd_out_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[4]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(4)
    );
\isa_sd_out_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[5]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(5)
    );
\isa_sd_out_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[6]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(6)
    );
\isa_sd_out_reg[7]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[7]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(7)
    );
\isa_sd_out_reg[8]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[8]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(8)
    );
\isa_sd_out_reg[9]\: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => \isa_sd_out[15]_i_1_n_0\,
      D => \isa_sd_out[9]_i_1_n_0\,
      PRE => SR(0),
      Q => isa_sd_out(9)
    );
isa_tri_en_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^oe_isa_sd1\,
      I1 => \^dir_isa_sd1\,
      O => isa_tri_en
    );
isa_wr_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AB00ABFFA800A800"
    )
        port map (
      I0 => isa_wr_done_i_2_n_0,
      I1 => isa_wr_done_i_3_n_0,
      I2 => \^out\(0),
      I3 => \^out\(1),
      I4 => isa_iow_i_3_n_0,
      I5 => isa_wr_done,
      O => isa_wr_done_i_1_n_0
    );
isa_wr_done_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[0]\,
      I1 => \isa_ctl_cnt_reg_n_0_[3]\,
      I2 => \^out\(0),
      O => isa_wr_done_i_2_n_0
    );
isa_wr_done_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[2]\,
      I1 => \isa_ctl_cnt_reg_n_0_[1]\,
      I2 => \isa_ctl_cnt_reg_n_0_[3]\,
      O => isa_wr_done_i_3_n_0
    );
isa_wr_done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => '1',
      CLR => SR(0),
      D => isa_wr_done_i_1_n_0,
      Q => isa_wr_done
    );
oe_isa_sd1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5CFF5C00"
    )
        port map (
      I0 => \^out\(1),
      I1 => oe_isa_sd1_i_3_n_0,
      I2 => \^out\(0),
      I3 => oe_isa_sd1_i_4_n_0,
      I4 => \^oe_isa_sd1\,
      O => oe_isa_sd1_i_1_n_0
    );
oe_isa_sd1_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[2]\,
      I1 => \isa_ctl_cnt_reg_n_0_[0]\,
      I2 => \isa_ctl_cnt_reg_n_0_[3]\,
      O => oe_isa_sd1_i_3_n_0
    );
oe_isa_sd1_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => \isa_ctl_cnt_reg_n_0_[1]\,
      I1 => \isa_ctl_cnt_reg_n_0_[2]\,
      I2 => \isa_ctl_cnt_reg_n_0_[3]\,
      I3 => \isa_ctl_cnt_reg_n_0_[0]\,
      I4 => \^out\(0),
      O => oe_isa_sd1_i_4_n_0
    );
oe_isa_sd1_reg: unisim.vcomponents.FDPE
     port map (
      C => clk_16m_i,
      CE => '1',
      D => oe_isa_sd1_i_1_n_0,
      PRE => SR(0),
      Q => \^oe_isa_sd1\
    );
\slave_isa_rd_data[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \^out\(0),
      I1 => \isa_ctl_cnt_reg_n_0_[0]\,
      I2 => \isa_ctl_cnt_reg_n_0_[2]\,
      I3 => \isa_ctl_cnt_reg_n_0_[3]\,
      I4 => \isa_ctl_cnt_reg_n_0_[1]\,
      I5 => \^out\(1),
      O => \slave_isa_rd_data[15]_i_1_n_0\
    );
\slave_isa_rd_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(0),
      Q => Q(0)
    );
\slave_isa_rd_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(10),
      Q => Q(9)
    );
\slave_isa_rd_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(11),
      Q => Q(10)
    );
\slave_isa_rd_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(12),
      Q => Q(11)
    );
\slave_isa_rd_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(13),
      Q => Q(12)
    );
\slave_isa_rd_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(14),
      Q => Q(13)
    );
\slave_isa_rd_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(15),
      Q => Q(14)
    );
\slave_isa_rd_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(1),
      Q => Q(1)
    );
\slave_isa_rd_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(2),
      Q => Q(2)
    );
\slave_isa_rd_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(3),
      Q => Q(3)
    );
\slave_isa_rd_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(4),
      Q => slave_isa_rd_data(4)
    );
\slave_isa_rd_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(5),
      Q => Q(4)
    );
\slave_isa_rd_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(6),
      Q => Q(5)
    );
\slave_isa_rd_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(7),
      Q => Q(6)
    );
\slave_isa_rd_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(8),
      Q => Q(7)
    );
\slave_isa_rd_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk_16m_i,
      CE => \slave_isa_rd_data[15]_i_1_n_0\,
      CLR => SR(0),
      D => isa_sd_in(9),
      Q => Q(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0_S00_AXI is
  port (
    s00_axi_awready : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    \axi_araddr_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \current_state_reg[0]\ : out STD_LOGIC;
    \current_state_reg[0]_0\ : out STD_LOGIC;
    \current_state_reg[1]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \isa_sa_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_rst_drv : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \FSM_sequential_current_state_reg[0]\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \slave_isa_rd_data_reg[15]\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \current_state_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0_S00_AXI is
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[4]_i_1_n_0\ : STD_LOGIC;
  signal \^axi_araddr_reg[2]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[4]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^isa_rst_drv\ : STD_LOGIC;
  signal \^isa_sa_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal master_isa_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[9]\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg6[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg6[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg6[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg6[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg7[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \current_state[0]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \current_state[1]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slv_reg0[0]_i_2\ : label is "soft_lutpair3";
begin
  Q(15 downto 0) <= \^q\(15 downto 0);
  SR(0) <= \^sr\(0);
  \axi_araddr_reg[2]_0\(0) <= \^axi_araddr_reg[2]_0\(0);
  isa_rst_drv <= \^isa_rst_drv\;
  \isa_sa_reg[15]\(15 downto 0) <= \^isa_sa_reg[15]\(15 downto 0);
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
\FSM_sequential_current_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444044444407"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(0),
      I2 => master_isa_state(1),
      I3 => master_isa_state(2),
      I4 => master_isa_state(3),
      I5 => master_isa_state(0),
      O => D(0)
    );
\FSM_sequential_current_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000004AAAAAAA8"
    )
        port map (
      I0 => \out\(1),
      I1 => master_isa_state(0),
      I2 => master_isa_state(3),
      I3 => master_isa_state(2),
      I4 => master_isa_state(1),
      I5 => \out\(0),
      O => D(1)
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s00_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => \^sr\(0)
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => sel0(1),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => sel0(2),
      O => \axi_araddr[4]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => \^axi_araddr_reg[2]_0\(0),
      R => \^sr\(0)
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => sel0(1),
      R => \^sr\(0)
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[4]_i_1_n_0\,
      Q => sel0(2),
      R => \^sr\(0)
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s00_axi_arready\,
      R => \^sr\(0)
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(2),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(2),
      O => \axi_awaddr[4]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => \^sr\(0)
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => \^sr\(0)
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[4]_i_1_n_0\,
      Q => p_0_in(2),
      R => \^sr\(0)
    );
axi_awready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s00_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s00_axi_awready\,
      R => \^sr\(0)
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => \^s00_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => \^sr\(0)
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => \current_state_reg[1]_0\(0),
      I1 => \slave_isa_rd_data_reg[15]\(0),
      I2 => sel0(2),
      I3 => master_isa_state(0),
      I4 => \^isa_rst_drv\,
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(0),
      I1 => slv_reg6(0),
      I2 => sel0(2),
      I3 => \^q\(0),
      I4 => \^isa_sa_reg[15]\(0),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(9),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[10]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(10),
      O => \axi_rdata[10]_i_2_n_0\
    );
\axi_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(10),
      I1 => slv_reg6(10),
      I2 => sel0(2),
      I3 => \^q\(10),
      I4 => \^isa_sa_reg[15]\(10),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[10]_i_3_n_0\
    );
\axi_rdata[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(10),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[11]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(11),
      O => \axi_rdata[11]_i_2_n_0\
    );
\axi_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(11),
      I1 => slv_reg6(11),
      I2 => sel0(2),
      I3 => \^q\(11),
      I4 => \^isa_sa_reg[15]\(11),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[11]_i_3_n_0\
    );
\axi_rdata[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(11),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[12]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(12),
      O => \axi_rdata[12]_i_2_n_0\
    );
\axi_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(12),
      I1 => slv_reg6(12),
      I2 => sel0(2),
      I3 => \^q\(12),
      I4 => \^isa_sa_reg[15]\(12),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[12]_i_3_n_0\
    );
\axi_rdata[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(12),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[13]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(13),
      O => \axi_rdata[13]_i_2_n_0\
    );
\axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(13),
      I1 => slv_reg6(13),
      I2 => sel0(2),
      I3 => \^q\(13),
      I4 => \^isa_sa_reg[15]\(13),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[13]_i_3_n_0\
    );
\axi_rdata[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(13),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[14]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(14),
      O => \axi_rdata[14]_i_2_n_0\
    );
\axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(14),
      I1 => slv_reg6(14),
      I2 => sel0(2),
      I3 => \^q\(14),
      I4 => \^isa_sa_reg[15]\(14),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[14]_i_3_n_0\
    );
\axi_rdata[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(14),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[15]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(15),
      O => \axi_rdata[15]_i_2_n_0\
    );
\axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(15),
      I1 => slv_reg6(15),
      I2 => sel0(2),
      I3 => \^q\(15),
      I4 => \^isa_sa_reg[15]\(15),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[15]_i_3_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[16]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(16),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[16]\,
      I5 => sel0(2),
      O => reg_data_out(16)
    );
\axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(16),
      I1 => slv_reg6(16),
      I2 => sel0(2),
      I3 => slv_reg3(16),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(16),
      O => \axi_rdata[16]_i_2_n_0\
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[17]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(17),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[17]\,
      I5 => sel0(2),
      O => reg_data_out(17)
    );
\axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(17),
      I1 => slv_reg6(17),
      I2 => sel0(2),
      I3 => slv_reg3(17),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(17),
      O => \axi_rdata[17]_i_2_n_0\
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[18]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(18),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[18]\,
      I5 => sel0(2),
      O => reg_data_out(18)
    );
\axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(18),
      I1 => slv_reg6(18),
      I2 => sel0(2),
      I3 => slv_reg3(18),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(18),
      O => \axi_rdata[18]_i_2_n_0\
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[19]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(19),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[19]\,
      I5 => sel0(2),
      O => reg_data_out(19)
    );
\axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(19),
      I1 => slv_reg6(19),
      I2 => sel0(2),
      I3 => slv_reg3(19),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(19),
      O => \axi_rdata[19]_i_2_n_0\
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => \current_state_reg[1]_0\(1),
      I1 => \slave_isa_rd_data_reg[15]\(1),
      I2 => sel0(2),
      I3 => master_isa_state(1),
      I4 => slv_reg0(1),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(1),
      I1 => slv_reg6(1),
      I2 => sel0(2),
      I3 => \^q\(1),
      I4 => \^isa_sa_reg[15]\(1),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[1]_i_3_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[20]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(20),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[20]\,
      I5 => sel0(2),
      O => reg_data_out(20)
    );
\axi_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(20),
      I1 => slv_reg6(20),
      I2 => sel0(2),
      I3 => slv_reg3(20),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(20),
      O => \axi_rdata[20]_i_2_n_0\
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[21]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(21),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[21]\,
      I5 => sel0(2),
      O => reg_data_out(21)
    );
\axi_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(21),
      I1 => slv_reg6(21),
      I2 => sel0(2),
      I3 => slv_reg3(21),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(21),
      O => \axi_rdata[21]_i_2_n_0\
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[22]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(22),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[22]\,
      I5 => sel0(2),
      O => reg_data_out(22)
    );
\axi_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(22),
      I1 => slv_reg6(22),
      I2 => sel0(2),
      I3 => slv_reg3(22),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(22),
      O => \axi_rdata[22]_i_2_n_0\
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[23]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(23),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[23]\,
      I5 => sel0(2),
      O => reg_data_out(23)
    );
\axi_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(23),
      I1 => slv_reg6(23),
      I2 => sel0(2),
      I3 => slv_reg3(23),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(23),
      O => \axi_rdata[23]_i_2_n_0\
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[24]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(24),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[24]\,
      I5 => sel0(2),
      O => reg_data_out(24)
    );
\axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(24),
      I1 => slv_reg6(24),
      I2 => sel0(2),
      I3 => slv_reg3(24),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(24),
      O => \axi_rdata[24]_i_2_n_0\
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[25]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(25),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[25]\,
      I5 => sel0(2),
      O => reg_data_out(25)
    );
\axi_rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(25),
      I1 => slv_reg6(25),
      I2 => sel0(2),
      I3 => slv_reg3(25),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(25),
      O => \axi_rdata[25]_i_2_n_0\
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[26]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(26),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[26]\,
      I5 => sel0(2),
      O => reg_data_out(26)
    );
\axi_rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(26),
      I1 => slv_reg6(26),
      I2 => sel0(2),
      I3 => slv_reg3(26),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(26),
      O => \axi_rdata[26]_i_2_n_0\
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[27]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(27),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[27]\,
      I5 => sel0(2),
      O => reg_data_out(27)
    );
\axi_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(27),
      I1 => slv_reg6(27),
      I2 => sel0(2),
      I3 => slv_reg3(27),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(27),
      O => \axi_rdata[27]_i_2_n_0\
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[28]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(28),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[28]\,
      I5 => sel0(2),
      O => reg_data_out(28)
    );
\axi_rdata[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(28),
      I1 => slv_reg6(28),
      I2 => sel0(2),
      I3 => slv_reg3(28),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(28),
      O => \axi_rdata[28]_i_2_n_0\
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[29]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(29),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[29]\,
      I5 => sel0(2),
      O => reg_data_out(29)
    );
\axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(29),
      I1 => slv_reg6(29),
      I2 => sel0(2),
      I3 => slv_reg3(29),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(29),
      O => \axi_rdata[29]_i_2_n_0\
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3030BB88"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(2),
      I1 => sel0(2),
      I2 => master_isa_state(2),
      I3 => slv_reg0(2),
      I4 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(2),
      I1 => slv_reg6(2),
      I2 => sel0(2),
      I3 => \^q\(2),
      I4 => \^isa_sa_reg[15]\(2),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[2]_i_3_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[30]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(30),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[30]\,
      I5 => sel0(2),
      O => reg_data_out(30)
    );
\axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(30),
      I1 => slv_reg6(30),
      I2 => sel0(2),
      I3 => slv_reg3(30),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(30),
      O => \axi_rdata[30]_i_2_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => sel0(1),
      I2 => slv_reg0(31),
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => \slv_reg1_reg_n_0_[31]\,
      I5 => sel0(2),
      O => reg_data_out(31)
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(31),
      I1 => slv_reg6(31),
      I2 => sel0(2),
      I3 => slv_reg3(31),
      I4 => \^axi_araddr_reg[2]_0\(0),
      I5 => slv_reg2(31),
      O => \axi_rdata[31]_i_2_n_0\
    );
\axi_rdata[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3030BB88"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(3),
      I1 => sel0(2),
      I2 => master_isa_state(3),
      I3 => slv_reg0(3),
      I4 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[3]_i_2_n_0\
    );
\axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(3),
      I1 => slv_reg6(3),
      I2 => sel0(2),
      I3 => \^q\(3),
      I4 => \^isa_sa_reg[15]\(3),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[3]_i_3_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \axi_rdata[4]_i_2_n_0\,
      I1 => sel0(1),
      I2 => \FSM_sequential_current_state_reg[0]\,
      I3 => sel0(2),
      I4 => \axi_rdata[4]_i_4_n_0\,
      O => reg_data_out(4)
    );
\axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(4),
      I1 => slv_reg6(4),
      I2 => sel0(2),
      I3 => \^q\(4),
      I4 => \^isa_sa_reg[15]\(4),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[4]_i_2_n_0\
    );
\axi_rdata[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[4]\,
      I1 => \^axi_araddr_reg[2]_0\(0),
      I2 => slv_reg0(4),
      O => \axi_rdata[4]_i_4_n_0\
    );
\axi_rdata[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(4),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[5]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(5),
      O => \axi_rdata[5]_i_2_n_0\
    );
\axi_rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(5),
      I1 => slv_reg6(5),
      I2 => sel0(2),
      I3 => \^q\(5),
      I4 => \^isa_sa_reg[15]\(5),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[5]_i_3_n_0\
    );
\axi_rdata[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(5),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[6]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(6),
      O => \axi_rdata[6]_i_2_n_0\
    );
\axi_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(6),
      I1 => slv_reg6(6),
      I2 => sel0(2),
      I3 => \^q\(6),
      I4 => \^isa_sa_reg[15]\(6),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[6]_i_3_n_0\
    );
\axi_rdata[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(6),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[7]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(7),
      O => \axi_rdata[7]_i_2_n_0\
    );
\axi_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(7),
      I1 => slv_reg6(7),
      I2 => sel0(2),
      I3 => \^q\(7),
      I4 => \^isa_sa_reg[15]\(7),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[7]_i_3_n_0\
    );
\axi_rdata[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(7),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[8]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(8),
      O => \axi_rdata[8]_i_2_n_0\
    );
\axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(8),
      I1 => slv_reg6(8),
      I2 => sel0(2),
      I3 => \^q\(8),
      I4 => \^isa_sa_reg[15]\(8),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[8]_i_3_n_0\
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slave_isa_rd_data_reg[15]\(8),
      I1 => sel0(2),
      I2 => \slv_reg1_reg_n_0_[9]\,
      I3 => \^axi_araddr_reg[2]_0\(0),
      I4 => slv_reg0(9),
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0AFA0CFCFC0C0"
    )
        port map (
      I0 => slv_reg7(9),
      I1 => slv_reg6(9),
      I2 => sel0(2),
      I3 => \^q\(9),
      I4 => \^isa_sa_reg[15]\(9),
      I5 => \^axi_araddr_reg[2]_0\(0),
      O => \axi_rdata[9]_i_3_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => \^sr\(0)
    );
\axi_rdata_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => \axi_rdata[0]_i_3_n_0\,
      O => reg_data_out(0),
      S => sel0(1)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => \^sr\(0)
    );
\axi_rdata_reg[10]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_2_n_0\,
      I1 => \axi_rdata[10]_i_3_n_0\,
      O => reg_data_out(10),
      S => sel0(1)
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => \^sr\(0)
    );
\axi_rdata_reg[11]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[11]_i_2_n_0\,
      I1 => \axi_rdata[11]_i_3_n_0\,
      O => reg_data_out(11),
      S => sel0(1)
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => \^sr\(0)
    );
\axi_rdata_reg[12]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_2_n_0\,
      I1 => \axi_rdata[12]_i_3_n_0\,
      O => reg_data_out(12),
      S => sel0(1)
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => \^sr\(0)
    );
\axi_rdata_reg[13]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[13]_i_2_n_0\,
      I1 => \axi_rdata[13]_i_3_n_0\,
      O => reg_data_out(13),
      S => sel0(1)
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => \^sr\(0)
    );
\axi_rdata_reg[14]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[14]_i_2_n_0\,
      I1 => \axi_rdata[14]_i_3_n_0\,
      O => reg_data_out(14),
      S => sel0(1)
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => \^sr\(0)
    );
\axi_rdata_reg[15]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => \axi_rdata[15]_i_3_n_0\,
      O => reg_data_out(15),
      S => sel0(1)
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => \^sr\(0)
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => \^sr\(0)
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => \^sr\(0)
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => \^sr\(0)
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => \^sr\(0)
    );
\axi_rdata_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_2_n_0\,
      I1 => \axi_rdata[1]_i_3_n_0\,
      O => reg_data_out(1),
      S => sel0(1)
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => \^sr\(0)
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => \^sr\(0)
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => \^sr\(0)
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => \^sr\(0)
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => \^sr\(0)
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => \^sr\(0)
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => \^sr\(0)
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => \^sr\(0)
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => \^sr\(0)
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => \^sr\(0)
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => \^sr\(0)
    );
\axi_rdata_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_2_n_0\,
      I1 => \axi_rdata[2]_i_3_n_0\,
      O => reg_data_out(2),
      S => sel0(1)
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => \^sr\(0)
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => \^sr\(0)
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => \^sr\(0)
    );
\axi_rdata_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[3]_i_2_n_0\,
      I1 => \axi_rdata[3]_i_3_n_0\,
      O => reg_data_out(3),
      S => sel0(1)
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => \^sr\(0)
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => \^sr\(0)
    );
\axi_rdata_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_2_n_0\,
      I1 => \axi_rdata[5]_i_3_n_0\,
      O => reg_data_out(5),
      S => sel0(1)
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => \^sr\(0)
    );
\axi_rdata_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_2_n_0\,
      I1 => \axi_rdata[6]_i_3_n_0\,
      O => reg_data_out(6),
      S => sel0(1)
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => \^sr\(0)
    );
\axi_rdata_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_2_n_0\,
      I1 => \axi_rdata[7]_i_3_n_0\,
      O => reg_data_out(7),
      S => sel0(1)
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => \^sr\(0)
    );
\axi_rdata_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[8]_i_2_n_0\,
      I1 => \axi_rdata[8]_i_3_n_0\,
      O => reg_data_out(8),
      S => sel0(1)
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => \^sr\(0)
    );
\axi_rdata_reg[9]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_2_n_0\,
      I1 => \axi_rdata[9]_i_3_n_0\,
      O => reg_data_out(9),
      S => sel0(1)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s00_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => \^sr\(0)
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s00_axi_wready\,
      R => \^sr\(0)
    );
\current_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => master_isa_state(0),
      I1 => master_isa_state(3),
      I2 => master_isa_state(2),
      I3 => master_isa_state(1),
      I4 => \out\(0),
      O => \current_state_reg[0]_0\
    );
\current_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => master_isa_state(0),
      I1 => master_isa_state(2),
      I2 => master_isa_state(3),
      I3 => master_isa_state(1),
      I4 => \out\(0),
      O => \current_state_reg[0]\
    );
\current_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \out\(0),
      I1 => master_isa_state(1),
      I2 => master_isa_state(2),
      I3 => master_isa_state(3),
      I4 => master_isa_state(0),
      I5 => \out\(1),
      O => \current_state_reg[1]\
    );
oe_isa_sd1_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^sr\(0)
    );
\slv_reg0[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg0[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s00_axi_wready\,
      I1 => \^s00_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => \^isa_rst_drv\,
      R => \^sr\(0)
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => \^sr\(0)
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => \^sr\(0)
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => \^sr\(0)
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => \^sr\(0)
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => \^sr\(0)
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => \^sr\(0)
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => \^sr\(0)
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => \^sr\(0)
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => \^sr\(0)
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => \^sr\(0)
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => \^sr\(0)
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => \^sr\(0)
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => \^sr\(0)
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => \^sr\(0)
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => \^sr\(0)
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => \^sr\(0)
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => \^sr\(0)
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => \^sr\(0)
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => \^sr\(0)
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => \^sr\(0)
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => \^sr\(0)
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => \^sr\(0)
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => \^sr\(0)
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => \^sr\(0)
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => \^sr\(0)
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => \^sr\(0)
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => \^sr\(0)
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => \^sr\(0)
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => \^sr\(0)
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => \^sr\(0)
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => \^sr\(0)
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(1),
      I4 => p_0_in(0),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(2),
      I4 => p_0_in(0),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(3),
      I4 => p_0_in(0),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(0),
      I4 => p_0_in(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => master_isa_state(0),
      R => \^sr\(0)
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg1_reg_n_0_[10]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg1_reg_n_0_[11]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg1_reg_n_0_[12]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg1_reg_n_0_[13]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg1_reg_n_0_[14]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg1_reg_n_0_[15]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg1_reg_n_0_[16]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg1_reg_n_0_[17]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg1_reg_n_0_[18]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg1_reg_n_0_[19]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => master_isa_state(1),
      R => \^sr\(0)
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg1_reg_n_0_[20]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg1_reg_n_0_[21]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg1_reg_n_0_[22]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg1_reg_n_0_[23]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg1_reg_n_0_[24]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg1_reg_n_0_[25]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg1_reg_n_0_[26]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg1_reg_n_0_[27]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg1_reg_n_0_[28]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg1_reg_n_0_[29]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => master_isa_state(2),
      R => \^sr\(0)
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg1_reg_n_0_[30]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg1_reg_n_0_[31]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => master_isa_state(3),
      R => \^sr\(0)
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg1_reg_n_0_[4]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg1_reg_n_0_[5]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg1_reg_n_0_[6]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg1_reg_n_0_[7]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg1_reg_n_0_[8]\,
      R => \^sr\(0)
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg1_reg_n_0_[9]\,
      R => \^sr\(0)
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      I4 => p_0_in(1),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      I4 => p_0_in(1),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      I4 => p_0_in(1),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      I4 => p_0_in(1),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^isa_sa_reg[15]\(0),
      R => \^sr\(0)
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^isa_sa_reg[15]\(10),
      R => \^sr\(0)
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^isa_sa_reg[15]\(11),
      R => \^sr\(0)
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^isa_sa_reg[15]\(12),
      R => \^sr\(0)
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^isa_sa_reg[15]\(13),
      R => \^sr\(0)
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^isa_sa_reg[15]\(14),
      R => \^sr\(0)
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^isa_sa_reg[15]\(15),
      R => \^sr\(0)
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => \^sr\(0)
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => \^sr\(0)
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => \^sr\(0)
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => \^sr\(0)
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^isa_sa_reg[15]\(1),
      R => \^sr\(0)
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => \^sr\(0)
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => \^sr\(0)
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => \^sr\(0)
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => \^sr\(0)
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => \^sr\(0)
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => \^sr\(0)
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => \^sr\(0)
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => \^sr\(0)
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => \^sr\(0)
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => \^sr\(0)
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^isa_sa_reg[15]\(2),
      R => \^sr\(0)
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => \^sr\(0)
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => \^sr\(0)
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^isa_sa_reg[15]\(3),
      R => \^sr\(0)
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^isa_sa_reg[15]\(4),
      R => \^sr\(0)
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^isa_sa_reg[15]\(5),
      R => \^sr\(0)
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^isa_sa_reg[15]\(6),
      R => \^sr\(0)
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^isa_sa_reg[15]\(7),
      R => \^sr\(0)
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^isa_sa_reg[15]\(8),
      R => \^sr\(0)
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^isa_sa_reg[15]\(9),
      R => \^sr\(0)
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^q\(0),
      R => \^sr\(0)
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^q\(10),
      R => \^sr\(0)
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^q\(11),
      R => \^sr\(0)
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^q\(12),
      R => \^sr\(0)
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^q\(13),
      R => \^sr\(0)
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^q\(14),
      R => \^sr\(0)
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^q\(15),
      R => \^sr\(0)
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => \^sr\(0)
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => \^sr\(0)
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => \^sr\(0)
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => \^sr\(0)
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^q\(1),
      R => \^sr\(0)
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => \^sr\(0)
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => \^sr\(0)
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => \^sr\(0)
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => \^sr\(0)
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => \^sr\(0)
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => \^sr\(0)
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => \^sr\(0)
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => \^sr\(0)
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => \^sr\(0)
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => \^sr\(0)
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^q\(2),
      R => \^sr\(0)
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => \^sr\(0)
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => \^sr\(0)
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^q\(3),
      R => \^sr\(0)
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^q\(4),
      R => \^sr\(0)
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^q\(5),
      R => \^sr\(0)
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^q\(6),
      R => \^sr\(0)
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^q\(7),
      R => \^sr\(0)
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^q\(8),
      R => \^sr\(0)
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^q\(9),
      R => \^sr\(0)
    );
\slv_reg6[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(1),
      I4 => p_0_in(2),
      O => \slv_reg6[15]_i_1_n_0\
    );
\slv_reg6[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(2),
      I4 => p_0_in(2),
      O => \slv_reg6[23]_i_1_n_0\
    );
\slv_reg6[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(3),
      I4 => p_0_in(2),
      O => \slv_reg6[31]_i_1_n_0\
    );
\slv_reg6[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => s00_axi_wstrb(0),
      I4 => p_0_in(2),
      O => \slv_reg6[7]_i_1_n_0\
    );
\slv_reg6_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg6(0),
      R => \^sr\(0)
    );
\slv_reg6_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg6(10),
      R => \^sr\(0)
    );
\slv_reg6_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg6(11),
      R => \^sr\(0)
    );
\slv_reg6_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg6(12),
      R => \^sr\(0)
    );
\slv_reg6_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg6(13),
      R => \^sr\(0)
    );
\slv_reg6_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg6(14),
      R => \^sr\(0)
    );
\slv_reg6_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg6(15),
      R => \^sr\(0)
    );
\slv_reg6_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg6(16),
      R => \^sr\(0)
    );
\slv_reg6_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg6(17),
      R => \^sr\(0)
    );
\slv_reg6_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg6(18),
      R => \^sr\(0)
    );
\slv_reg6_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg6(19),
      R => \^sr\(0)
    );
\slv_reg6_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg6(1),
      R => \^sr\(0)
    );
\slv_reg6_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg6(20),
      R => \^sr\(0)
    );
\slv_reg6_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg6(21),
      R => \^sr\(0)
    );
\slv_reg6_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg6(22),
      R => \^sr\(0)
    );
\slv_reg6_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg6(23),
      R => \^sr\(0)
    );
\slv_reg6_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg6(24),
      R => \^sr\(0)
    );
\slv_reg6_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg6(25),
      R => \^sr\(0)
    );
\slv_reg6_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg6(26),
      R => \^sr\(0)
    );
\slv_reg6_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg6(27),
      R => \^sr\(0)
    );
\slv_reg6_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg6(28),
      R => \^sr\(0)
    );
\slv_reg6_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg6(29),
      R => \^sr\(0)
    );
\slv_reg6_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg6(2),
      R => \^sr\(0)
    );
\slv_reg6_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg6(30),
      R => \^sr\(0)
    );
\slv_reg6_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg6(31),
      R => \^sr\(0)
    );
\slv_reg6_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg6(3),
      R => \^sr\(0)
    );
\slv_reg6_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg6(4),
      R => \^sr\(0)
    );
\slv_reg6_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg6(5),
      R => \^sr\(0)
    );
\slv_reg6_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg6(6),
      R => \^sr\(0)
    );
\slv_reg6_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg6(7),
      R => \^sr\(0)
    );
\slv_reg6_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg6(8),
      R => \^sr\(0)
    );
\slv_reg6_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg6[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg6(9),
      R => \^sr\(0)
    );
\slv_reg7[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg7[15]_i_1_n_0\
    );
\slv_reg7[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg7[23]_i_1_n_0\
    );
\slv_reg7[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg7[31]_i_1_n_0\
    );
\slv_reg7[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in(2),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg7[7]_i_1_n_0\
    );
\slv_reg7_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg7(0),
      R => \^sr\(0)
    );
\slv_reg7_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg7(10),
      R => \^sr\(0)
    );
\slv_reg7_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg7(11),
      R => \^sr\(0)
    );
\slv_reg7_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg7(12),
      R => \^sr\(0)
    );
\slv_reg7_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg7(13),
      R => \^sr\(0)
    );
\slv_reg7_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg7(14),
      R => \^sr\(0)
    );
\slv_reg7_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg7(15),
      R => \^sr\(0)
    );
\slv_reg7_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg7(16),
      R => \^sr\(0)
    );
\slv_reg7_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg7(17),
      R => \^sr\(0)
    );
\slv_reg7_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg7(18),
      R => \^sr\(0)
    );
\slv_reg7_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg7(19),
      R => \^sr\(0)
    );
\slv_reg7_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg7(1),
      R => \^sr\(0)
    );
\slv_reg7_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg7(20),
      R => \^sr\(0)
    );
\slv_reg7_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg7(21),
      R => \^sr\(0)
    );
\slv_reg7_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg7(22),
      R => \^sr\(0)
    );
\slv_reg7_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg7(23),
      R => \^sr\(0)
    );
\slv_reg7_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg7(24),
      R => \^sr\(0)
    );
\slv_reg7_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg7(25),
      R => \^sr\(0)
    );
\slv_reg7_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg7(26),
      R => \^sr\(0)
    );
\slv_reg7_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg7(27),
      R => \^sr\(0)
    );
\slv_reg7_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg7(28),
      R => \^sr\(0)
    );
\slv_reg7_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg7(29),
      R => \^sr\(0)
    );
\slv_reg7_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg7(2),
      R => \^sr\(0)
    );
\slv_reg7_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg7(30),
      R => \^sr\(0)
    );
\slv_reg7_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg7(31),
      R => \^sr\(0)
    );
\slv_reg7_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg7(3),
      R => \^sr\(0)
    );
\slv_reg7_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg7(4),
      R => \^sr\(0)
    );
\slv_reg7_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg7(5),
      R => \^sr\(0)
    );
\slv_reg7_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg7(6),
      R => \^sr\(0)
    );
\slv_reg7_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg7(7),
      R => \^sr\(0)
    );
\slv_reg7_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg7(8),
      R => \^sr\(0)
    );
\slv_reg7_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg7(9),
      R => \^sr\(0)
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s00_axi_arready\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0 is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    isa_rst_drv : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    isa_sa : out STD_LOGIC_VECTOR ( 15 downto 0 );
    isa_sd_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    isa_tri_en : out STD_LOGIC;
    oe_isa_sd1 : out STD_LOGIC;
    dir_isa_sd1 : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    isa_iow : out STD_LOGIC;
    isa_ior : out STD_LOGIC;
    clk_16m_i : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    isa_sd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0 is
  signal ISA_Controller_inst_n_0 : STD_LOGIC;
  signal ISA_Controller_inst_n_1 : STD_LOGIC;
  signal ISA_Controller_inst_n_6 : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal isa_20190731_v1_0_S00_AXI_inst_n_1 : STD_LOGIC;
  signal isa_20190731_v1_0_S00_AXI_inst_n_10 : STD_LOGIC;
  signal isa_20190731_v1_0_S00_AXI_inst_n_11 : STD_LOGIC;
  signal isa_20190731_v1_0_S00_AXI_inst_n_9 : STD_LOGIC;
  signal \next_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_isa_rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal slv_reg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal slv_reg3 : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
ISA_Controller_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ISA_Controller
     port map (
      D(1 downto 0) => \next_state__0\(1 downto 0),
      \FSM_sequential_current_state_reg[0]_0\ => isa_20190731_v1_0_S00_AXI_inst_n_11,
      Q(14 downto 4) => slave_isa_rd_data(15 downto 5),
      Q(3 downto 0) => slave_isa_rd_data(3 downto 0),
      SR(0) => isa_20190731_v1_0_S00_AXI_inst_n_1,
      \axi_rdata_reg[4]\ => ISA_Controller_inst_n_6,
      clk_16m_i => clk_16m_i,
      \current_state_reg[0]_0\(1 downto 0) => current_state(1 downto 0),
      dir_isa_sd1 => dir_isa_sd1,
      isa_ior => isa_ior,
      isa_iow => isa_iow,
      isa_sa(15 downto 0) => isa_sa(15 downto 0),
      isa_sd_in(15 downto 0) => isa_sd_in(15 downto 0),
      isa_sd_out(15 downto 0) => isa_sd_out(15 downto 0),
      isa_tri_en => isa_tri_en,
      oe_isa_sd1 => oe_isa_sd1,
      \out\(1) => ISA_Controller_inst_n_0,
      \out\(0) => ISA_Controller_inst_n_1,
      sel0(0) => sel0(0),
      \slv_reg1_reg[0]\ => isa_20190731_v1_0_S00_AXI_inst_n_10,
      \slv_reg1_reg[0]_0\ => isa_20190731_v1_0_S00_AXI_inst_n_9,
      \slv_reg2_reg[15]\(15 downto 0) => slv_reg2(15 downto 0),
      \slv_reg3_reg[15]\(15 downto 0) => slv_reg3(15 downto 0)
    );
isa_20190731_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0_S00_AXI
     port map (
      D(1 downto 0) => \next_state__0\(1 downto 0),
      \FSM_sequential_current_state_reg[0]\ => ISA_Controller_inst_n_6,
      Q(15 downto 0) => slv_reg3(15 downto 0),
      SR(0) => isa_20190731_v1_0_S00_AXI_inst_n_1,
      \axi_araddr_reg[2]_0\(0) => sel0(0),
      \current_state_reg[0]\ => isa_20190731_v1_0_S00_AXI_inst_n_9,
      \current_state_reg[0]_0\ => isa_20190731_v1_0_S00_AXI_inst_n_10,
      \current_state_reg[1]\ => isa_20190731_v1_0_S00_AXI_inst_n_11,
      \current_state_reg[1]_0\(1 downto 0) => current_state(1 downto 0),
      isa_rst_drv => isa_rst_drv,
      \isa_sa_reg[15]\(15 downto 0) => slv_reg2(15 downto 0),
      \out\(1) => ISA_Controller_inst_n_0,
      \out\(0) => ISA_Controller_inst_n_1,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(2 downto 0) => s00_axi_araddr(2 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(2 downto 0) => s00_axi_awaddr(2 downto 0),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      \slave_isa_rd_data_reg[15]\(14 downto 4) => slave_isa_rd_data(15 downto 5),
      \slave_isa_rd_data_reg[15]\(3 downto 0) => slave_isa_rd_data(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_isa_20190731_0_0,isa_20190731_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "isa_20190731_v1_0,Vivado 2018.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^dir_isa_sd1\ : STD_LOGIC;
  signal \^oe_isa_sd1\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 8, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  dir_isa_in <= \<const1>\;
  dir_isa_out <= \<const0>\;
  dir_isa_sa1 <= \<const0>\;
  dir_isa_sa2 <= \<const0>\;
  dir_isa_sd1 <= \^dir_isa_sd1\;
  dir_isa_sd2 <= \^dir_isa_sd1\;
  isa_aen <= \<const0>\;
  oe_isa_in <= \<const0>\;
  oe_isa_out <= \<const0>\;
  oe_isa_sa1 <= \<const0>\;
  oe_isa_sa2 <= \<const0>\;
  oe_isa_sd1 <= \^oe_isa_sd1\;
  oe_isa_sd2 <= \^oe_isa_sd1\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_isa_20190731_v1_0
     port map (
      clk_16m_i => clk_16m_i,
      dir_isa_sd1 => \^dir_isa_sd1\,
      isa_ior => isa_ior,
      isa_iow => isa_iow,
      isa_rst_drv => isa_rst_drv,
      isa_sa(15 downto 0) => isa_sa(15 downto 0),
      isa_sd_in(15 downto 0) => isa_sd_in(15 downto 0),
      isa_sd_out(15 downto 0) => isa_sd_out(15 downto 0),
      isa_tri_en => isa_tri_en,
      oe_isa_sd1 => \^oe_isa_sd1\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(2 downto 0) => s00_axi_araddr(4 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(2 downto 0) => s00_axi_awaddr(4 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
