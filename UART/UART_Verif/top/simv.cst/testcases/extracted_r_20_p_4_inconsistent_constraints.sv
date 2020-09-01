class c_20_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_20_4;
    c_20_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x0z10x00z0xz11x01xzzz1z00xxzz1xxzxxzxxxxzzxxzxxxzzzzzzxzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
