class c_81_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_81_1;
    c_81_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xz10z00xxx1xz1zz01z11zz11xx0zx1zxxxxxzzxxxzxzxxxzxzxzxxzzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
