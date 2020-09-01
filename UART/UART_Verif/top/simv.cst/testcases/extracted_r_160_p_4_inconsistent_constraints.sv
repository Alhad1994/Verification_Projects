class c_160_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_160_4;
    c_160_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11011z0xxz110zzz10xz101zz0x1101zzzxzxzxxxzzzzzzxzxzxzxzxzzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
