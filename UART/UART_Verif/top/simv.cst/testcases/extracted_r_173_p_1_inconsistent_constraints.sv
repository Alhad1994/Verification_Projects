class c_173_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_173_1;
    c_173_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111000zxx10zx0zxxx10z0000x11z0z0zxxzxxzxzxxzzxzxxxzzxzzxxxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
