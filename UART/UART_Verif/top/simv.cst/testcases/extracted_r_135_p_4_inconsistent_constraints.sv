class c_135_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_135_4;
    c_135_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00z0zz1zx01zxx0xzxx10zxxz0zz0z00zxxzzzzxxzxzxzxzzxxxzxxzxxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
