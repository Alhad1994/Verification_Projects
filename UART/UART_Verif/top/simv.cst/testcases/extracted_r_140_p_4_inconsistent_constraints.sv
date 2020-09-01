class c_140_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_140_4;
    c_140_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "101x011100x000z1xxzz10xz01zzzzxxzzzzxxxxxxzzxzzxxzzxxxxzzxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
