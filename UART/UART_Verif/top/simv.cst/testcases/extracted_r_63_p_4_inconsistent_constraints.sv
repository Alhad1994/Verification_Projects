class c_63_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_63_4;
    c_63_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx11xz00x1xz1xx0xx000xx1zz011xzzzxzzxzzzxzxzxzzxzxzxzzxxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
