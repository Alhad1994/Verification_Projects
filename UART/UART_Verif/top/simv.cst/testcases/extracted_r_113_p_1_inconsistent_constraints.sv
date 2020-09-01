class c_113_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_113_1;
    c_113_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1111110z0111xzxz0xx0zxx0xzxxxzzzzzxzxzzxzzxxxzzzzzxzzxxzzzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
