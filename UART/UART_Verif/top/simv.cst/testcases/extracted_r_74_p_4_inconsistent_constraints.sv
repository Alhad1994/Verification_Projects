class c_74_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_74_4;
    c_74_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0111zz00xx0zzx0z0xz011zx0x0zxxzzxzzxzxxzxzzxzxxzzzzzxxxzzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
