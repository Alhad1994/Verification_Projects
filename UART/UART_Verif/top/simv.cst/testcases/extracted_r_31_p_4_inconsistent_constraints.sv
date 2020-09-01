class c_31_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_31_4;
    c_31_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10z011x1xz1x01x110xx100010x1111xzxxzxzxxxxzxxxzzzxxzxxxxxxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
