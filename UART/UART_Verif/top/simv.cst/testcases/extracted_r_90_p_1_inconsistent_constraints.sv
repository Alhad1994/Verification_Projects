class c_90_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_90_1;
    c_90_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x010zzzz01zz0x01xx00zzzx10z0xzxxxxxxxxzxzzzxzxxxxzzzzxzzzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
