class c_50_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_50_4;
    c_50_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxx10110x00010x1xzz11x1zxx10xz10xxzxxxzzzzzzxzzzzzzzzzzzzzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
