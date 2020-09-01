class c_180_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_180_4;
    c_180_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx01z00x10xz11zz0000z0zz01001xzzxxxxzzxzxxxxzzzzzxzxxxxxxzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
