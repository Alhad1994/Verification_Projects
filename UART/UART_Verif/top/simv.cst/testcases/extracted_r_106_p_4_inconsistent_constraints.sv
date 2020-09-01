class c_106_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_106_4;
    c_106_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzxx0z11zx111xzx0zx11x11zxx00xx1xxzzxxzxxzxxxxzxzzxzxxzxxxzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
