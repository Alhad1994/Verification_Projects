class c_144_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_144_1;
    c_144_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00z1zz0011x10x111xz01x110z1xzxx1xzzxxxzzzxzzzxzzxzxzxzzzzzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
