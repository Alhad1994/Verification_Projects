class c_147_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_147_4;
    c_147_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1001zxzx0x0z0x0xx11xx1x0x1zxzzxxzzxzzxzxxxxzzxzzxxxxzzxzxxzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
