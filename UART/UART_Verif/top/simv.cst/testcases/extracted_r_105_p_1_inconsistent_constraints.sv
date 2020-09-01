class c_105_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_105_1;
    c_105_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001zxxxxx1101zz001x1x1zx0x1xxxzxzzzzxzzxxxzzxzzxzzxzzzzzxzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
