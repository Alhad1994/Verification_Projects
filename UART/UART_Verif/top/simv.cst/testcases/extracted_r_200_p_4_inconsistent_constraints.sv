class c_200_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_200_4;
    c_200_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx0x0x0x1x010z011zzz00zx10zx01xxzxzzxzxzzzzzzxzxxxzxxxxxxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
