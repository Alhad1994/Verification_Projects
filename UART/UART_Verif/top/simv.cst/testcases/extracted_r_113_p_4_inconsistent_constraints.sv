class c_113_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_113_4;
    c_113_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z1z11zx00z0xz0z1x1x0101101111zxxxxxxzxxxxxxzxzxxzzzxzxzxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
