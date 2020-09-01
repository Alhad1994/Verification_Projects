class c_155_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_155_4;
    c_155_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z0001z0zzxzxzxx1xz1x1100011z11xzxzxxzxzzxxzxzxxzzzzzxxzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
