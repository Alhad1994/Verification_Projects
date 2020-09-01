class c_153_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_153_4;
    c_153_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1zzx1x0z1zxz1xzz1x00xz111xxx0xxzxzzxzzzzxzxzzzzzxxxzxzxxzxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
