class c_127_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_127_1;
    c_127_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z00xz01xx1xz0x1x1xzzz10x01z0xzzzxxzxxxxxxxxzxzzxxxzxzzxxxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
