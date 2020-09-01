class c_25_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_25_4;
    c_25_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z10x1111z110z1zz1zzxz1x0zx011x1zzxxzxzxzzxxxxzxzzzzxzxzxxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
