class c_53_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_53_4;
    c_53_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0000zx0100z1011z11000zzzzzxzzxzzzxxzxxzzzzxxzzzxzxxzxzxzxxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
