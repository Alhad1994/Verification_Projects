class c_48_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_48_4;
    c_48_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzzz110x001z01zx1xzx01z10xzz10zxzzxzxxzxxzzzzzzzzzzzzxxzzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
