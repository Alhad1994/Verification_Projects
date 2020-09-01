class c_66_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_66_4;
    c_66_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zxxz01xx11zx01xz01x1z0zz01011xzxxzzzzzxzxzxzxxxxxxzzzxxxzxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
