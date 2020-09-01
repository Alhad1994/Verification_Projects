class c_150_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_150_1;
    c_150_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1zz1z0zx11zz1x111zz1zx0z1101z0zzzzzxxxxxxzxxzxxzzxxzzxzxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
