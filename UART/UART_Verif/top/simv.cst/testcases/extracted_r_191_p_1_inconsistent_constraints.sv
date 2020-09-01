class c_191_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_191_1;
    c_191_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z1100x100z01zz01zz00xz01zx011xzxzzzxxxxxzxzxzxzzzzzxzzxzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
