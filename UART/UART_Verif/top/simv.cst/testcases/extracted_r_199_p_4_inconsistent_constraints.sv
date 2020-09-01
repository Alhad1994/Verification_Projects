class c_199_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_199_4;
    c_199_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z11zzz00z00x01x0x1zzx11zx01z00zxxzzzxxxxxxxxzxzxzxxzzzzxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
