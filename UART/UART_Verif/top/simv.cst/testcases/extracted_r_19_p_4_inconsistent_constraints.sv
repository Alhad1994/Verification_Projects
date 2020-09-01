class c_19_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_19_4;
    c_19_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1z1zxzz1zxx10x1zx0xx01zx1010x1zzzzzzzzzzxxzzzxxxxxzxxxzzxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
