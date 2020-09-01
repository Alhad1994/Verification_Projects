class c_179_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_179_4;
    c_179_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1z1000x1x10xz010xzx01zz0000xxzxxzzzxzxzzxzzzzxzxxzzzxxxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
