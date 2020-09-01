class c_169_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_169_1;
    c_169_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx110x0z1x1x0zz11zx0z1zz1xzxz101xxzzxxxxxxzzxzzxzzzxzzzzxxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
