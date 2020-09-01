class c_131_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_131_4;
    c_131_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000z0010z000x0z01xxx10x01xz01001zxxxxxxxzxzxxzzxzzxzxzzzxzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
