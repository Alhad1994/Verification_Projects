class c_105_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_105_4;
    c_105_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1110xz10zzzz1x1111xz101z000zxxxxxxxzxxzxzxzxzxzzxxxxxzzxzzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
