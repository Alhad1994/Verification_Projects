class c_200_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_200_1;
    c_200_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x00zz00z111x001z1z11010xz0z11z1xzzzxzxzxzzzxxxzxxzxxxxxxxzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
