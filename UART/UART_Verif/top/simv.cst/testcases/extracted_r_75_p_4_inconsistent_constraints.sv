class c_75_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_75_4;
    c_75_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz00xz01000xz0z10011z00zz11xz110zzxxzxxxzxxzxzzzzzxzxxzxzzxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
