class c_2_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_2_4;
    c_2_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1zz10z1xx1zz00x0001zxx0101z100xxxxxzzxzxxzxxxxzzzxxxxzzxxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
