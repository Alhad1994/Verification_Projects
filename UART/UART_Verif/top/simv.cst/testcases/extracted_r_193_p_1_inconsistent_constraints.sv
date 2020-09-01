class c_193_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_193_1;
    c_193_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx01xz111xx10x1000xxzz1x1xz10xxxxzzzxzzzxxxxzxxzxzxzxzzzzzxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
