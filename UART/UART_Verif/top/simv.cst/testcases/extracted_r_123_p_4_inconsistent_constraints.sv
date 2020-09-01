class c_123_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_123_4;
    c_123_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11xz1xx1100x10x0z1z0zxx11z1zxzxxxxzzzxxzxxxzxzzzzxxzxxxxzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
