class c_111_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_111_4;
    c_111_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00xzxz010000zxzz0z10xz10x0xx0x0xxxzxzxxxzxxzzxzxzzzxxxxzzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
