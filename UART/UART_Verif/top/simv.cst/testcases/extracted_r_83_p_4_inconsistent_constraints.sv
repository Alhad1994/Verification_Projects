class c_83_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_83_4;
    c_83_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z010x0xxz101z01zzx00zx0z01zzx0x1zxzxzzxzxzxzzzzxzxzzzxxzxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
