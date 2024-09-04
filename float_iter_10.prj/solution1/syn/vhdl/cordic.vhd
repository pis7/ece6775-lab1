-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordic is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    theta : IN STD_LOGIC_VECTOR (63 downto 0);
    s : OUT STD_LOGIC_VECTOR (63 downto 0);
    s_ap_vld : OUT STD_LOGIC;
    c : OUT STD_LOGIC_VECTOR (63 downto 0);
    c_ap_vld : OUT STD_LOGIC );
end;


architecture behav of cordic is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "cordic,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.232000,HLS_SYN_LAT=191,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=39,HLS_SYN_FF=2576,HLS_SYN_LUT=4899,HLS_VERSION=2019_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (19 downto 0) := "00000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (19 downto 0) := "00000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (19 downto 0) := "00000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (19 downto 0) := "00000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (19 downto 0) := "00000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (19 downto 0) := "00000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (19 downto 0) := "00001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (19 downto 0) := "00010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (19 downto 0) := "00100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (19 downto 0) := "01000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (19 downto 0) := "10000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_3FE36E978D4FDF3B : STD_LOGIC_VECTOR (63 downto 0) := "0011111111100011011011101001011110001101010011111101111100111011";
    constant ap_const_lv64_3FF0000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "0011111111110000000000000000000000000000000000000000000000000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv64_3FE0000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "0011111111100000000000000000000000000000000000000000000000000000";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_BFF0000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "1011111111110000000000000000000000000000000000000000000000000000";
    constant ap_const_lv5_2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal cordic_ctab_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal cordic_ctab_ce0 : STD_LOGIC;
    signal cordic_ctab_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_157_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_181 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_fu_162_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_187 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_167_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_193 : STD_LOGIC_VECTOR (63 downto 0);
    signal step_fu_205_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal step_reg_274 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln37_fu_199_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln46_fu_258_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln46_reg_284 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal cordic_ctab_load_reg_291 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_146_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal theta_assign_reg_296 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal ap_CS_fsm_state20 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state20 : signal is "none";
    signal grp_fu_152_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal cur_sin_0_reg_87 : STD_LOGIC_VECTOR (63 downto 0);
    signal old_cos_reg_100 : STD_LOGIC_VECTOR (63 downto 0);
    signal scale_f_0_reg_113 : STD_LOGIC_VECTOR (63 downto 0);
    signal step_0_reg_125 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_0_reg_136 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln50_fu_211_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_146_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_146_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal grp_fu_157_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_157_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_fu_162_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_162_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_167_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_167_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bitcast_ln41_fu_216_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_fu_220_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln41_fu_230_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal icmp_ln41_1_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_fu_234_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_fu_246_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_175_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln41_fu_252_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (19 downto 0);

    component cordic_dsub_64ns_bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component cordic_dadd_64ns_cud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component cordic_dmul_64ns_dEe IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component cordic_dcmp_64ns_eOg IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component cordic_cordic_ctab IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (5 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin
    cordic_ctab_U : component cordic_cordic_ctab
    generic map (
        DataWidth => 64,
        AddressRange => 64,
        AddressWidth => 6)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => cordic_ctab_address0,
        ce0 => cordic_ctab_ce0,
        q0 => cordic_ctab_q0);

    cordic_dsub_64ns_bkb_U1 : component cordic_dsub_64ns_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_146_p0,
        din1 => grp_fu_146_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_146_p2);

    cordic_dadd_64ns_cud_U2 : component cordic_dadd_64ns_cud
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => reg_187,
        din1 => cur_sin_0_reg_87,
        ce => ap_const_logic_1,
        dout => grp_fu_152_p2);

    cordic_dmul_64ns_dEe_U3 : component cordic_dmul_64ns_dEe
    generic map (
        ID => 1,
        NUM_STAGE => 6,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_157_p0,
        din1 => grp_fu_157_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_157_p2);

    cordic_dmul_64ns_dEe_U4 : component cordic_dmul_64ns_dEe
    generic map (
        ID => 1,
        NUM_STAGE => 6,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_162_p0,
        din1 => grp_fu_162_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_162_p2);

    cordic_dmul_64ns_dEe_U5 : component cordic_dmul_64ns_dEe
    generic map (
        ID => 1,
        NUM_STAGE => 6,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_167_p0,
        din1 => grp_fu_167_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_167_p2);

    cordic_dcmp_64ns_eOg_U6 : component cordic_dcmp_64ns_eOg
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => p_0_reg_136,
        din1 => ap_const_lv64_0,
        ce => ap_const_logic_1,
        opcode => ap_const_lv5_2,
        dout => grp_fu_175_p2);





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


    cur_sin_0_reg_87_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
                cur_sin_0_reg_87 <= grp_fu_152_p2;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                cur_sin_0_reg_87 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;

    old_cos_reg_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
                old_cos_reg_100 <= grp_fu_146_p2;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                old_cos_reg_100 <= ap_const_lv64_3FE36E978D4FDF3B;
            end if; 
        end if;
    end process;

    p_0_reg_136_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
                p_0_reg_136 <= theta_assign_reg_296;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                p_0_reg_136 <= theta;
            end if; 
        end if;
    end process;

    scale_f_0_reg_113_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
                scale_f_0_reg_113 <= reg_193;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                scale_f_0_reg_113 <= ap_const_lv64_3FF0000000000000;
            end if; 
        end if;
    end process;

    step_0_reg_125_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
                step_0_reg_125 <= step_reg_274;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                step_0_reg_125 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                cordic_ctab_load_reg_291 <= cordic_ctab_q0;
                    select_ln46_reg_284(63) <= select_ln46_fu_258_p3(63);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state15) or (ap_const_logic_1 = ap_CS_fsm_state9))) then
                reg_181 <= grp_fu_157_p2;
                reg_187 <= grp_fu_162_p2;
                reg_193 <= grp_fu_167_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                step_reg_274 <= step_fu_205_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state14)) then
                theta_assign_reg_296 <= grp_fu_146_p2;
            end if;
        end if;
    end process;
    select_ln46_reg_284(62 downto 0) <= "011111111110000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln37_fu_199_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln37_fu_199_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    and_ln41_fu_252_p2 <= (or_ln41_fu_246_p2 and grp_fu_175_p2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state20 <= ap_CS_fsm(19);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(ap_CS_fsm_state2, icmp_ln37_fu_199_p2)
    begin
        if (((icmp_ln37_fu_199_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln37_fu_199_p2)
    begin
        if (((icmp_ln37_fu_199_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    bitcast_ln41_fu_216_p1 <= p_0_reg_136;
    c <= old_cos_reg_100;

    c_ap_vld_assign_proc : process(ap_CS_fsm_state2, icmp_ln37_fu_199_p2)
    begin
        if (((icmp_ln37_fu_199_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            c_ap_vld <= ap_const_logic_1;
        else 
            c_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    cordic_ctab_address0 <= zext_ln50_fu_211_p1(6 - 1 downto 0);

    cordic_ctab_ce0_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            cordic_ctab_ce0 <= ap_const_logic_1;
        else 
            cordic_ctab_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_146_p0_assign_proc : process(old_cos_reg_100, p_0_reg_136, ap_CS_fsm_state10, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_146_p0 <= old_cos_reg_100;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_146_p0 <= p_0_reg_136;
        else 
            grp_fu_146_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_146_p1_assign_proc : process(reg_181, reg_193, ap_CS_fsm_state10, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_146_p1 <= reg_181;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_146_p1 <= reg_193;
        else 
            grp_fu_146_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_157_p0_assign_proc : process(reg_181, cur_sin_0_reg_87, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_157_p0 <= reg_181;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_157_p0 <= cur_sin_0_reg_87;
        else 
            grp_fu_157_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_157_p1_assign_proc : process(select_ln46_reg_284, scale_f_0_reg_113, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_157_p1 <= scale_f_0_reg_113;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_157_p1 <= select_ln46_reg_284;
        else 
            grp_fu_157_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_162_p0_assign_proc : process(reg_187, old_cos_reg_100, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_162_p0 <= reg_187;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_162_p0 <= old_cos_reg_100;
        else 
            grp_fu_162_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_162_p1_assign_proc : process(select_ln46_reg_284, scale_f_0_reg_113, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_162_p1 <= scale_f_0_reg_113;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_162_p1 <= select_ln46_reg_284;
        else 
            grp_fu_162_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_167_p0_assign_proc : process(select_ln46_reg_284, scale_f_0_reg_113, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_167_p0 <= scale_f_0_reg_113;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_167_p0 <= select_ln46_reg_284;
        else 
            grp_fu_167_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_167_p1_assign_proc : process(cordic_ctab_load_reg_291, ap_CS_fsm_state10, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_167_p1 <= ap_const_lv64_3FE0000000000000;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_167_p1 <= cordic_ctab_load_reg_291;
        else 
            grp_fu_167_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln37_fu_199_p2 <= "1" when (step_0_reg_125 = ap_const_lv4_A) else "0";
    icmp_ln41_1_fu_240_p2 <= "1" when (trunc_ln41_fu_230_p1 = ap_const_lv52_0) else "0";
    icmp_ln41_fu_234_p2 <= "0" when (tmp_fu_220_p4 = ap_const_lv11_7FF) else "1";
    or_ln41_fu_246_p2 <= (icmp_ln41_fu_234_p2 or icmp_ln41_1_fu_240_p2);
    s <= cur_sin_0_reg_87;

    s_ap_vld_assign_proc : process(ap_CS_fsm_state2, icmp_ln37_fu_199_p2)
    begin
        if (((icmp_ln37_fu_199_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            s_ap_vld <= ap_const_logic_1;
        else 
            s_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    select_ln46_fu_258_p3 <= 
        ap_const_lv64_3FF0000000000000 when (and_ln41_fu_252_p2(0) = '1') else 
        ap_const_lv64_BFF0000000000000;
    step_fu_205_p2 <= std_logic_vector(unsigned(step_0_reg_125) + unsigned(ap_const_lv4_1));
    tmp_fu_220_p4 <= bitcast_ln41_fu_216_p1(62 downto 52);
    trunc_ln41_fu_230_p1 <= bitcast_ln41_fu_216_p1(52 - 1 downto 0);
    zext_ln50_fu_211_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(step_0_reg_125),64));
end behav;
