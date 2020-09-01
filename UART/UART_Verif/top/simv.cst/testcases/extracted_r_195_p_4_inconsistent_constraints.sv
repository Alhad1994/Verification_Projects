class c_195_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_195_4;
    c_195_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxxxz01000101z1z0xz0z01zx0x0zz11zzzxzzxxxxxxzxxxzxxxzzzxxxzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
