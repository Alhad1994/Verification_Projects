class c_29_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_29_4;
    c_29_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0zx0zxz0xzzzxx0zxzzx0z0z0zz000xxxxxxxzxzzxzzxzzzzxxzzxxxxzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
