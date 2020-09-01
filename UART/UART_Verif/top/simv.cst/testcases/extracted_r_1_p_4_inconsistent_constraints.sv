class c_1_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_1_4;
    c_1_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0010z1x0zxxzzx01z1zz01z010x00110zxzzxzzxxxzxzzxxxzzxzxzzxxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
