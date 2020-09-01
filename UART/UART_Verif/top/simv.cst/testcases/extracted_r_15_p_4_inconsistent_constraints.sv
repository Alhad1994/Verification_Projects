class c_15_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_15_4;
    c_15_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zxz01x0z10xzz11x01xx0x01110z11xxxxzzzxzxxzzzxzzxxzzzzxxzxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
