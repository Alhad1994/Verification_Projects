class c_175_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_175_4;
    c_175_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz1z100zzxx10x1zxz01z0zzx0x1xx0xzzxxzxzzzxzzxxzxzxzxzzzxxxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
