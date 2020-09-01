class c_114_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_114_1;
    c_114_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1011zxx1zzx0zz01xxzxzzxx00z110zzxxzxxzzxxzzxzzzxxzxxxzxzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
