class c_39_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_39_4;
    c_39_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz010xxzz00xzx00x100zz1xzzzz00zxxzxxxxxzzzzzzxxzzxxzzzxzxzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
