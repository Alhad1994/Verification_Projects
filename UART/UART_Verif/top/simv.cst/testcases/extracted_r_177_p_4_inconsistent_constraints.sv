class c_177_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_177_4;
    c_177_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0x0x1z0z110z1xzz0z0xxxxx0z1xzzzxzzxxzzzxzxxzzzzxxxxzzxxzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
