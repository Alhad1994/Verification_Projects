class c_3_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_3_1;
    c_3_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100xxzxzxx1111zxxxz1z0xzz10xzzxxxzzzxxzxzxzxxxzzzxzzxzxxxxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram