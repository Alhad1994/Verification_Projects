class c_174_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_174_4;
    c_174_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x11z011101x1zzz10zxxxz111xx0zzxxxxzxxzxxzzzxxxzxzxxxzzxxzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
