class c_182_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_182_4;
    c_182_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zzz0zx1zzx0zz0zxxxzx10z1xxz0xzzzzzxzzzxxxxzxxxxxzxzzxzxzzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
