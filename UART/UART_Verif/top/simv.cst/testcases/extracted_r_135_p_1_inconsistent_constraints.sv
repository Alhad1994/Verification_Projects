class c_135_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_135_1;
    c_135_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xx0x010xzz0111xx1xx11x0zx00z11zxxxxzzxxzxzxzzzzxzxzxzzxzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
