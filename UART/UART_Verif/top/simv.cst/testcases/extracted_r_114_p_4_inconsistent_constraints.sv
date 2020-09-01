class c_114_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_114_4;
    c_114_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz1x0x0x0xzzzz100000xzx0x0011zzxxxzxxzxzzzzxzzxxzxxzxxxxxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
