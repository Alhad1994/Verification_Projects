class c_187_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_187_1;
    c_187_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx1z110z01x0zxz1z1xzzz0101x10zzzxzzxzxxzxxzxxzxzxxxxxzzxzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
