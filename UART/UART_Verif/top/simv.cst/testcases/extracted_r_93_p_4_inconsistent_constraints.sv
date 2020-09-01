class c_93_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_93_4;
    c_93_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0001zzx1zx0x1xxxz0z0100z000x0z1xzxzxxzzxzxzzxzzzzzzzzxzxxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
