class c_120_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_120_4;
    c_120_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx0xz11z1xx0100xx011z10z000z11zxzxzxxxzzzxxxxxzzzxxxzxxxxxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
