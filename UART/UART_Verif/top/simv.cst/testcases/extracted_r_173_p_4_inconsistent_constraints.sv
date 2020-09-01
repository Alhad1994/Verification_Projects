class c_173_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_173_4;
    c_173_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xz1xxxxx1x10zxx1z11x0zz011000zxxxxzzxzzzxxzxzxxzzxzxxzzzxxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
