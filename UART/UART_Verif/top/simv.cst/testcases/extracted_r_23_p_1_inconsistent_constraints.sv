class c_23_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_23_1;
    c_23_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10z0z1xxz10z10xxxx00xx01x0x0110xxzzzxxxzzxxxzxzzzxxzxzxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
