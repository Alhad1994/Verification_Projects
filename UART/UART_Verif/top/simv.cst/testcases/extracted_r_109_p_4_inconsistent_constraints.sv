class c_109_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_109_4;
    c_109_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzzzz01z1xxz0zz01zx1z011xzxx11xxzxxzzxzxxxxzxxzzzxxzxxxxxzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
