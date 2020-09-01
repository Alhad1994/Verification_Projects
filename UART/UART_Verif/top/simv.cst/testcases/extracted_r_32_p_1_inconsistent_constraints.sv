class c_32_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_32_1;
    c_32_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z000zxxzx1xxx0x111x01x0xx011zxxzxzzxzzxzzzzzzzzxzzxxzxxxzxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
