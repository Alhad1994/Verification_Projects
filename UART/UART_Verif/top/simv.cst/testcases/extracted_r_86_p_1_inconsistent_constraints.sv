class c_86_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_86_1;
    c_86_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz01x1zz1x0z10x11xx00z101xz01zzzxxzxxzzxxxzzzxxxxzzzzxzzxxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
