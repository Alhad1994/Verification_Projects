class c_94_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_94_4;
    c_94_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000zzzzx1xzxzzx101011x11x1z1x0x1xzxxxzxzxxxzzzzxxzxzzzzzzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
