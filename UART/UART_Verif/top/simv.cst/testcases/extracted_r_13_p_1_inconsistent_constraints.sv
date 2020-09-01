class c_13_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_13_1;
    c_13_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111zxz100z1001z0zz1x0z1xx1000110zxzxxxxxzzxxxzxzxzxzzzzxzxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
