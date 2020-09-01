class c_43_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_43_1;
    c_43_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0zx0001zz00zzxxxxzzxx11zx100x01zxzzzzzzzzzzzxxzzxzxzxzzzxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
