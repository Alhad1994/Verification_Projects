class c_45_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_45_4;
    c_45_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz0100z100x101zx1xzx101x0z0x00x1xxzxzxzzzzzxzxzxzxxxzzzxxzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
