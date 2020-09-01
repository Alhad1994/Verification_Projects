class c_44_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_44_4;
    c_44_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1zz110010z11z1xz00011z1010xx1xxxzzxxzzxzxxxzzzxzxxzzxxzzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
