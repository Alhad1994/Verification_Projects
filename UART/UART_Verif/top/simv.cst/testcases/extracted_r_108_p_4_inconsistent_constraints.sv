class c_108_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_108_4;
    c_108_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1xxzxx01zz1x111z0x1x0zzz110xzxzzxxxzzxxxxxxxxxzxzxxzzxzxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
