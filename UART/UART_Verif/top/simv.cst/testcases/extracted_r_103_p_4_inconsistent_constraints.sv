class c_103_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_103_4;
    c_103_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzx00z00xzxx0z01z01zxx0z00x1xx01zxzzzxzxzzzzxzzxxxzzzxxzzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
