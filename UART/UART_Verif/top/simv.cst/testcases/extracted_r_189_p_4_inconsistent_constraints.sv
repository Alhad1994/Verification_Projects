class c_189_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_189_4;
    c_189_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0zz0z00xzx1001xz11zz1x1z0z00z00xzzxxzzxxzxzzzzzzxzzxzzxxxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
