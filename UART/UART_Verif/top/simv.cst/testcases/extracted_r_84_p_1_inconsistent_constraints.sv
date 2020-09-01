class c_84_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_84_1;
    c_84_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zxzxzz0z0xzxz0x0001110zx00z1zxxzxzzzxxxzxzxzzxzxxzzxzzzzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
