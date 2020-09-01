class c_98_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_98_1;
    c_98_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0xzzzz1x1zz1zx10xxx101011zxz0zxxzzxxxxzxxzxzzxxxxzxxxzzzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
