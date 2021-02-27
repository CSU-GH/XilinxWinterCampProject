-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contrastadj_xfrgb2ycrcb_1080_1920_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    img1_431_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    img1_431_empty_n : IN STD_LOGIC;
    img1_431_read : OUT STD_LOGIC;
    img2_432_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    img2_432_full_n : IN STD_LOGIC;
    img2_432_write : OUT STD_LOGIC );
end;


architecture behav of contrastadj_xfrgb2ycrcb_1080_1920_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv21_1FA400 : STD_LOGIC_VECTOR (20 downto 0) := "111111010010000000000";
    constant ap_const_lv21_1 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv11_80 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv22_2646 : STD_LOGIC_VECTOR (21 downto 0) := "0000000010011001000110";
    constant ap_const_lv20_E98 : STD_LOGIC_VECTOR (19 downto 0) := "00000000111010011000";
    constant ap_const_lv23_4B23 : STD_LOGIC_VECTOR (22 downto 0) := "00000000100101100100011";
    constant ap_const_lv25_5B44 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000101101101000100";
    constant ap_const_lv25_4831 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000100100000110001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal img1_431_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln99_reg_408 : STD_LOGIC_VECTOR (0 downto 0);
    signal img2_432_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter9 : STD_LOGIC := '0';
    signal icmp_ln99_reg_408_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_reg_99 : STD_LOGIC_VECTOR (20 downto 0);
    signal icmp_ln99_fu_110_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_state10_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_state11_pp0_stage0_iter9 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln99_reg_408_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln99_reg_408_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln99_fu_116_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal trunc_ln674_fu_122_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_417 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_417_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_417_pp0_iter3_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_417_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_417_pp0_iter5_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal G_assign_reg_422 : STD_LOGIC_VECTOR (7 downto 0);
    signal G_assign_reg_422_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal B_assign_reg_427 : STD_LOGIC_VECTOR (7 downto 0);
    signal B_assign_reg_427_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal B_assign_reg_427_pp0_iter3_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal B_assign_reg_427_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal B_assign_reg_427_pp0_iter5_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_368_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal Value_uchar_10_fu_165_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_10_reg_458 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_10_reg_458_pp0_iter7_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_10_reg_458_pp0_iter8_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal grp_fu_374_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_383_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal zext_ln852_fu_159_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln941_fu_174_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln941_fu_178_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln852_3_fu_162_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln951_fu_188_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_392_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln_fu_198_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal sext_ln738_fu_207_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal Value_int_fu_220_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_fu_226_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln738_4_fu_211_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln740_fu_236_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_242_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln740_fu_264_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln740_fu_256_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_fu_250_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_400_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln738_5_fu_278_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal sext_ln738_2_fu_287_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal Value_int_2_fu_300_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_6_fu_306_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln738_6_fu_291_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln740_2_fu_316_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_322_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln740_2_fu_344_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln740_5_fu_336_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_8_fu_330_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_12_fu_350_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_11_fu_270_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_368_p0 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_368_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_374_p0 : STD_LOGIC_VECTOR (12 downto 0);
    signal grp_fu_374_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_383_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_383_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_383_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_392_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_400_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_368_ce : STD_LOGIC;
    signal grp_fu_374_ce : STD_LOGIC;
    signal grp_fu_383_ce : STD_LOGIC;
    signal grp_fu_392_ce : STD_LOGIC;
    signal grp_fu_400_ce : STD_LOGIC;
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal grp_fu_368_p10 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_374_p10 : STD_LOGIC_VECTOR (19 downto 0);
    signal grp_fu_383_p10 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_383_p20 : STD_LOGIC_VECTOR (22 downto 0);

    component contrastadj_mul_mul_15ns_8ns_22_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (14 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component contrastadj_mac_muladd_13ns_8ns_22ns_22_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (12 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (21 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component contrastadj_mac_muladd_16ns_8ns_22ns_23_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (21 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component contrastadj_mul_mul_16ns_9s_25_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (24 downto 0) );
    end component;



begin
    mul_mul_15ns_8ns_22_4_1_U12 : component contrastadj_mul_mul_15ns_8ns_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 15,
        din1_WIDTH => 8,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_368_p0,
        din1 => grp_fu_368_p1,
        ce => grp_fu_368_ce,
        dout => grp_fu_368_p2);

    mac_muladd_13ns_8ns_22ns_22_4_1_U13 : component contrastadj_mac_muladd_13ns_8ns_22ns_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 13,
        din1_WIDTH => 8,
        din2_WIDTH => 22,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_374_p0,
        din1 => grp_fu_374_p1,
        din2 => grp_fu_368_p2,
        ce => grp_fu_374_ce,
        dout => grp_fu_374_p3);

    mac_muladd_16ns_8ns_22ns_23_4_1_U14 : component contrastadj_mac_muladd_16ns_8ns_22ns_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 8,
        din2_WIDTH => 22,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_383_p0,
        din1 => grp_fu_383_p1,
        din2 => grp_fu_383_p2,
        ce => grp_fu_383_ce,
        dout => grp_fu_383_p3);

    mul_mul_16ns_9s_25_4_1_U15 : component contrastadj_mul_mul_16ns_9s_25_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 9,
        dout_WIDTH => 25)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_392_p0,
        din1 => sub_ln941_fu_178_p2,
        ce => grp_fu_392_ce,
        dout => grp_fu_392_p2);

    mul_mul_16ns_9s_25_4_1_U16 : component contrastadj_mul_mul_16ns_9s_25_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 9,
        dout_WIDTH => 25)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_400_p0,
        din1 => sub_ln951_fu_188_p2,
        ce => grp_fu_400_ce,
        dout => grp_fu_400_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter9_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter9 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
                elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter9 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    indvar_flatten_reg_99_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln99_fu_110_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                indvar_flatten_reg_99 <= add_ln99_fu_116_p2;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                indvar_flatten_reg_99 <= ap_const_lv21_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                B_assign_reg_427 <= img1_431_dout(23 downto 16);
                G_assign_reg_422 <= img1_431_dout(15 downto 8);
                trunc_ln674_reg_417 <= trunc_ln674_fu_122_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                B_assign_reg_427_pp0_iter2_reg <= B_assign_reg_427;
                B_assign_reg_427_pp0_iter3_reg <= B_assign_reg_427_pp0_iter2_reg;
                B_assign_reg_427_pp0_iter4_reg <= B_assign_reg_427_pp0_iter3_reg;
                B_assign_reg_427_pp0_iter5_reg <= B_assign_reg_427_pp0_iter4_reg;
                G_assign_reg_422_pp0_iter2_reg <= G_assign_reg_422;
                Value_uchar_10_reg_458_pp0_iter7_reg <= Value_uchar_10_reg_458;
                Value_uchar_10_reg_458_pp0_iter8_reg <= Value_uchar_10_reg_458_pp0_iter7_reg;
                icmp_ln99_reg_408_pp0_iter2_reg <= icmp_ln99_reg_408_pp0_iter1_reg;
                icmp_ln99_reg_408_pp0_iter3_reg <= icmp_ln99_reg_408_pp0_iter2_reg;
                icmp_ln99_reg_408_pp0_iter4_reg <= icmp_ln99_reg_408_pp0_iter3_reg;
                icmp_ln99_reg_408_pp0_iter5_reg <= icmp_ln99_reg_408_pp0_iter4_reg;
                icmp_ln99_reg_408_pp0_iter6_reg <= icmp_ln99_reg_408_pp0_iter5_reg;
                icmp_ln99_reg_408_pp0_iter7_reg <= icmp_ln99_reg_408_pp0_iter6_reg;
                icmp_ln99_reg_408_pp0_iter8_reg <= icmp_ln99_reg_408_pp0_iter7_reg;
                trunc_ln674_reg_417_pp0_iter2_reg <= trunc_ln674_reg_417;
                trunc_ln674_reg_417_pp0_iter3_reg <= trunc_ln674_reg_417_pp0_iter2_reg;
                trunc_ln674_reg_417_pp0_iter4_reg <= trunc_ln674_reg_417_pp0_iter3_reg;
                trunc_ln674_reg_417_pp0_iter5_reg <= trunc_ln674_reg_417_pp0_iter4_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln99_reg_408_pp0_iter5_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                Value_uchar_10_reg_458 <= grp_fu_383_p3(22 downto 15);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln99_reg_408 <= icmp_ln99_fu_110_p2;
                icmp_ln99_reg_408_pp0_iter1_reg <= icmp_ln99_reg_408;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter9, icmp_ln99_fu_110_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, ap_enable_reg_pp0_iter8)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln99_fu_110_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and not(((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln99_fu_110_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state12;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    Value_int_2_fu_300_p2 <= std_logic_vector(unsigned(ap_const_lv11_80) + unsigned(sext_ln738_2_fu_287_p1));
    Value_int_fu_220_p2 <= std_logic_vector(unsigned(ap_const_lv11_80) + unsigned(sext_ln738_fu_207_p1));
    Value_uchar_10_fu_165_p4 <= grp_fu_383_p3(22 downto 15);
    Value_uchar_11_fu_270_p3 <= 
        select_ln740_fu_256_p3 when (or_ln740_fu_264_p2(0) = '1') else 
        Value_uchar_fu_250_p2;
    Value_uchar_12_fu_350_p3 <= 
        select_ln740_5_fu_336_p3 when (or_ln740_2_fu_344_p2(0) = '1') else 
        Value_uchar_8_fu_330_p2;
    Value_uchar_8_fu_330_p2 <= (trunc_ln738_6_fu_291_p4 xor ap_const_lv8_80);
    Value_uchar_fu_250_p2 <= (trunc_ln738_4_fu_211_p4 xor ap_const_lv8_80);
    add_ln99_fu_116_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_99) + unsigned(ap_const_lv21_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state12 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(img1_431_empty_n, img2_432_full_n, ap_enable_reg_pp0_iter1, icmp_ln99_reg_408, ap_enable_reg_pp0_iter9, icmp_ln99_reg_408_pp0_iter8_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (img2_432_full_n = ap_const_logic_0)) or ((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (img1_431_empty_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(img1_431_empty_n, img2_432_full_n, ap_enable_reg_pp0_iter1, icmp_ln99_reg_408, ap_enable_reg_pp0_iter9, icmp_ln99_reg_408_pp0_iter8_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (img2_432_full_n = ap_const_logic_0)) or ((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (img1_431_empty_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(img1_431_empty_n, img2_432_full_n, ap_enable_reg_pp0_iter1, icmp_ln99_reg_408, ap_enable_reg_pp0_iter9, icmp_ln99_reg_408_pp0_iter8_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (img2_432_full_n = ap_const_logic_0)) or ((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (img1_431_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state10_pp0_stage0_iter8 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state11_pp0_stage0_iter9_assign_proc : process(img2_432_full_n, icmp_ln99_reg_408_pp0_iter8_reg)
    begin
                ap_block_state11_pp0_stage0_iter9 <= ((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (img2_432_full_n = ap_const_logic_0));
    end process;

        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_pp0_stage0_iter1_assign_proc : process(img1_431_empty_n, icmp_ln99_reg_408)
    begin
                ap_block_state3_pp0_stage0_iter1 <= ((icmp_ln99_reg_408 = ap_const_lv1_0) and (img1_431_empty_n = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state9_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state2_assign_proc : process(icmp_ln99_fu_110_p2)
    begin
        if ((icmp_ln99_fu_110_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state12)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter9, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state12)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_368_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_368_ce <= ap_const_logic_1;
        else 
            grp_fu_368_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_368_p0 <= ap_const_lv22_2646(15 - 1 downto 0);
    grp_fu_368_p1 <= grp_fu_368_p10(8 - 1 downto 0);
    grp_fu_368_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_fu_122_p1),22));

    grp_fu_374_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_374_ce <= ap_const_logic_1;
        else 
            grp_fu_374_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_374_p0 <= ap_const_lv20_E98(13 - 1 downto 0);
    grp_fu_374_p1 <= grp_fu_374_p10(8 - 1 downto 0);
    grp_fu_374_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(B_assign_reg_427),20));

    grp_fu_383_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_383_ce <= ap_const_logic_1;
        else 
            grp_fu_383_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_383_p0 <= ap_const_lv23_4B23(16 - 1 downto 0);
    grp_fu_383_p1 <= grp_fu_383_p10(8 - 1 downto 0);
    grp_fu_383_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(G_assign_reg_422_pp0_iter2_reg),23));
    grp_fu_383_p2 <= grp_fu_383_p20(22 - 1 downto 0);
    grp_fu_383_p20 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_374_p3),23));

    grp_fu_392_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_392_ce <= ap_const_logic_1;
        else 
            grp_fu_392_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_392_p0 <= ap_const_lv25_5B44(16 - 1 downto 0);

    grp_fu_400_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_400_ce <= ap_const_logic_1;
        else 
            grp_fu_400_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_400_p0 <= ap_const_lv25_4831(16 - 1 downto 0);
    icmp_ln740_2_fu_316_p2 <= "1" when (signed(tmp_6_fu_306_p4) > signed(ap_const_lv3_0)) else "0";
    icmp_ln740_fu_236_p2 <= "1" when (signed(tmp_fu_226_p4) > signed(ap_const_lv3_0)) else "0";
    icmp_ln99_fu_110_p2 <= "1" when (indvar_flatten_reg_99 = ap_const_lv21_1FA400) else "0";

    img1_431_blk_n_assign_proc : process(img1_431_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln99_reg_408)
    begin
        if (((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            img1_431_blk_n <= img1_431_empty_n;
        else 
            img1_431_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    img1_431_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln99_reg_408, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln99_reg_408 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            img1_431_read <= ap_const_logic_1;
        else 
            img1_431_read <= ap_const_logic_0;
        end if; 
    end process;


    img2_432_blk_n_assign_proc : process(img2_432_full_n, ap_block_pp0_stage0, ap_enable_reg_pp0_iter9, icmp_ln99_reg_408_pp0_iter8_reg)
    begin
        if (((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            img2_432_blk_n <= img2_432_full_n;
        else 
            img2_432_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img2_432_din <= ((Value_uchar_12_fu_350_p3 & Value_uchar_11_fu_270_p3) & Value_uchar_10_reg_458_pp0_iter8_reg);

    img2_432_write_assign_proc : process(ap_enable_reg_pp0_iter9, icmp_ln99_reg_408_pp0_iter8_reg, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln99_reg_408_pp0_iter8_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            img2_432_write <= ap_const_logic_1;
        else 
            img2_432_write <= ap_const_logic_0;
        end if; 
    end process;

    or_ln740_2_fu_344_p2 <= (tmp_7_fu_322_p3 or icmp_ln740_2_fu_316_p2);
    or_ln740_fu_264_p2 <= (tmp_5_fu_242_p3 or icmp_ln740_fu_236_p2);
    select_ln740_5_fu_336_p3 <= 
        ap_const_lv8_FF when (icmp_ln740_2_fu_316_p2(0) = '1') else 
        ap_const_lv8_0;
    select_ln740_fu_256_p3 <= 
        ap_const_lv8_FF when (icmp_ln740_fu_236_p2(0) = '1') else 
        ap_const_lv8_0;
        sext_ln738_2_fu_287_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln738_5_fu_278_p4),11));

        sext_ln738_fu_207_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_198_p4),11));

    sub_ln941_fu_178_p2 <= std_logic_vector(unsigned(zext_ln852_fu_159_p1) - unsigned(zext_ln941_fu_174_p1));
    sub_ln951_fu_188_p2 <= std_logic_vector(unsigned(zext_ln852_3_fu_162_p1) - unsigned(zext_ln941_fu_174_p1));
    tmp_5_fu_242_p3 <= Value_int_fu_220_p2(10 downto 10);
    tmp_6_fu_306_p4 <= Value_int_2_fu_300_p2(10 downto 8);
    tmp_7_fu_322_p3 <= Value_int_2_fu_300_p2(10 downto 10);
    tmp_fu_226_p4 <= Value_int_fu_220_p2(10 downto 8);
    trunc_ln674_fu_122_p1 <= img1_431_dout(8 - 1 downto 0);
    trunc_ln738_4_fu_211_p4 <= grp_fu_392_p2(22 downto 15);
    trunc_ln738_5_fu_278_p4 <= grp_fu_400_p2(24 downto 15);
    trunc_ln738_6_fu_291_p4 <= grp_fu_400_p2(22 downto 15);
    trunc_ln_fu_198_p4 <= grp_fu_392_p2(24 downto 15);
    zext_ln852_3_fu_162_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(B_assign_reg_427_pp0_iter5_reg),9));
    zext_ln852_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_reg_417_pp0_iter5_reg),9));
    zext_ln941_fu_174_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Value_uchar_10_fu_165_p4),9));
end behav;
