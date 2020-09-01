class c_100_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_100_4;
    c_100_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z1xx0x0x01x1zz0xxx111xzx10x0zzxxxzxzxzxxzzzxzxxzxzzzxxxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
