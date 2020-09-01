class c_9_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_9_1;
    c_9_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1x11z1x1x0xx01zzzz0000xx1x01z1xxzxxzzzzxxxxzzzzzzzxzzxzzxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
