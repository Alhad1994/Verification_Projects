class c_59_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_59_4;
    c_59_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx10zxzx1xz11110xx1zzzxzz0x10zzzxzzzxzxzzzxzxxxxxxxxzzxzzxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
