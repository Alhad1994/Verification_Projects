class c_76_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_76_4;
    c_76_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00xz1z1x000zzz0000x0xzzzx11z1x11zxzxxxzzxxzzxxxzxzzxxxxxzzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
