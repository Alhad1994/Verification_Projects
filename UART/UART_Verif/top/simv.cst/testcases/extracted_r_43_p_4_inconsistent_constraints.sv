class c_43_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_43_4;
    c_43_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01zxzxxz11111010xxzzxz1z1zz1011zxzzxzxzxxzxxzxzzxxzzzxxzzxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
