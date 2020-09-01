class c_69_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_69_4;
    c_69_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz0z0x1x0010xx1xx01zzx10zz0zz00xxzzzxzxxxxzxxxxxxxxzzzzxxxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
