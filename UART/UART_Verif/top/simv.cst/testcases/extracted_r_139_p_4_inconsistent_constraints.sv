class c_139_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_139_4;
    c_139_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx010x0x1zx10zz10101x01z1zx0xz0zzzzxzxxzxzxzzzzxxzxxxzzzzxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
