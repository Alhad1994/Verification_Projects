class c_183_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_183_4;
    c_183_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0xz1xzx10xx1xz1z1xz011xxxx0xxxxxxzxzxzxxxzxzxzxzxxxxzzxzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
