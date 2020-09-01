class c_136_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_136_1;
    c_136_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxxz00z0x1x0z1zz10zzzzz10x010xzzzzxxzzzxzxxzzzxzxzxxzzzxzzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
