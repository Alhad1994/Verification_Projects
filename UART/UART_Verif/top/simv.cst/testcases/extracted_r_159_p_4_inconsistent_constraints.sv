class c_159_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_159_4;
    c_159_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx0z1010zz0z1x0xxx011x11zz10zz0xzxxzxzzxxxxzxxxxxzxxzzzxzxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
