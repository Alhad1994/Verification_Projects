class c_52_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_52_4;
    c_52_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz1zx100x001zz1x11z111zxz0z00zxzxxzxxzzzxxxxzzxzzzxxzzzzxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
