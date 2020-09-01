class c_126_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_126_1;
    c_126_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1xxzxx1z010z100111x0zx010xzx0xxzxxxzxxzxxzxzxxxxxxzxxzzxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
