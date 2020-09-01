class c_30_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_30_4;
    c_30_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x10zxzxxz0z01x00x1xz0010x1z1zxxzzzzzzzzxzxxxzzzzxxxzxxxzxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram