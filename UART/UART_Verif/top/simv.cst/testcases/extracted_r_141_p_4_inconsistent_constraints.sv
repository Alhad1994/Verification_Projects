class c_141_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_141_4;
    c_141_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzz01zxx10x1x0zx11z0xxx1x11zz10xzxzzzxzzxzzxzzxxxxxxxzxxzxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
