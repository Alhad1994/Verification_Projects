class c_174_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_174_1;
    c_174_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011zz0zzzx0x1z0z011xz0x01zz10100xzxzzxzzzxzxxxzzzxzxxzzzxzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
