class c_162_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_162_4;
    c_162_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zzx0zz1zz1xxz0zxzz1z1xxxz0x1zx0zxzzxzxzzxzxzxxzzxxxxzxzxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
