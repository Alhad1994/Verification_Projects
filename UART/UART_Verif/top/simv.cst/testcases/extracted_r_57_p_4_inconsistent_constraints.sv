class c_57_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_57_4;
    c_57_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00zz1zz0xz100110x1zzz10xz0x1z1xzxzxxzxzxxxzxxxxzxxxxzzxzxxzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
