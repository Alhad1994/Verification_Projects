class c_171_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_171_4;
    c_171_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxzz1zz1z1xz1z0zz1x1zx1xxxz0zx0xzxxxxxzzzzxxxxxzxzxxzzxxzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
