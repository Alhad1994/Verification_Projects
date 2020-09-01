class c_168_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_168_4;
    c_168_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1z00z0z101zx0z0zxxx00xxzxx0zzzxzzzxzzxxxxzzxzzzzxxzzzxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
