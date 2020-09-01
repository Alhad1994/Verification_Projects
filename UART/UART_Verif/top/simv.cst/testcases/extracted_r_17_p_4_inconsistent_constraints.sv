class c_17_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_17_4;
    c_17_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0zx1xx01z1zxzzx0zzx1x0zxx1x011xzzxxxxxxxxxzzxzxzxzxzzxxzxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
