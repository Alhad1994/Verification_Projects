class c_82_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_82_4;
    c_82_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10000z00x0x1zxz0z0zzz11xzxzx0z1zzzxzxzxzxxzzzzzxxxxxzxxxzxzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
