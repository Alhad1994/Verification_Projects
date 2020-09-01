class c_116_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_116_1;
    c_116_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxx1011z1x1111xzzzzzz010x0101zxxxxxzxzxzzxxxzzzxxxxzzzxxxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
