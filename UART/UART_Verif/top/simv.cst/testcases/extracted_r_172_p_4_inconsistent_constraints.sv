class c_172_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_172_4;
    c_172_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0xz10z0xz0110z1xz1x0x110zz0xzx1xzzzxxxzxzxxxxxxxzzxzxzzxxzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
