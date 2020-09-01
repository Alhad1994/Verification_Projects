class c_65_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_65_4;
    c_65_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx110x00xxxx0xzzzzzxx110x10z11x0xxzxxzzzzzxzzxzxxxxxzxzzzzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
