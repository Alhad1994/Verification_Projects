class c_146_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_146_1;
    c_146_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx0100xx1xzzz1xx0xxxx010x1000xzxxzxzxxzxxzzzzzxxxzxzzxzxxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
