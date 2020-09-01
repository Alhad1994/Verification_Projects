class c_73_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_73_4;
    c_73_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x00z1xzx1zxx0x1zzxzz001zx1x1zxxxxzxxzxxzzzzzzzxzxxzxxxzzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
