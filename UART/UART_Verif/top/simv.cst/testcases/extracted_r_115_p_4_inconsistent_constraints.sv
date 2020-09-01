class c_115_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_115_4;
    c_115_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10z0010x0z1011010xx1xz10000zxzz1xxzxzzzzxzxxzxzxxzxxzxzzxxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
