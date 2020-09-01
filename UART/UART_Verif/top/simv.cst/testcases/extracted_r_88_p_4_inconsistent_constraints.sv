class c_88_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_88_4;
    c_88_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxzx0x0xz01z00zz0x0z1z01xxzz11zzzxxzzzzzzzzzxzzzzxzxzzzzxxzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
