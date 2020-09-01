class c_37_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_37_1;
    c_37_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zx0z0z1011x1zxzz1z1xx1x1xx0z11xxzxxzxzzxzxxxzxzzxzxxxzxxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
