class c_62_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_62_4;
    c_62_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1110zzxxxzz0x10xzx0x0zz100xz1zzzzzxzzzzzxzzzxxzzxxzzxzzzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
