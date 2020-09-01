class c_6_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_6_4;
    c_6_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zxz1xxxxxz1xx1xzxzxz11z1z0z1zx1xxxxzzzxxxxzxzxxxxxzzxzzzxxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
