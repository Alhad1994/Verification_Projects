class c_145_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_145_4;
    c_145_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z110x00zxzz01x0z1zz0x00z0z110z0zzxxxxzzzxzzzzxxxzzxxxxzxzzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
