class c_78_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_78_4;
    c_78_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0x010z0z0x10z0zxz01xz1x1z110x0xzxxzxxzzzxzzzxxxxzxzxzxzzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
