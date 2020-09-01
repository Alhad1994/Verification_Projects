class c_80_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_80_4;
    c_80_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzzx01x110x1xxzxx1z0z011zxx1zx11xxxxzzzxxzzzzzzxxzzzzzzxxxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
