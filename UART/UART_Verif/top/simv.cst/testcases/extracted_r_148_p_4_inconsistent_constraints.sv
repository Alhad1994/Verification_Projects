class c_148_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_148_4;
    c_148_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0001100xxxz1x00z0z0zx00zz10zxzzxzxxxxxzxxxzxzxxxzxxzxzzzxxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
