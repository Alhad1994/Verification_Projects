class c_70_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_70_4;
    c_70_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001zxxxzxx0z11xx1z1xzx11xx10x1x1zzzzxxxzxzxxxzzzzzxzxxzzzzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
