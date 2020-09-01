class c_168_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_168_1;
    c_168_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxxz1xzx1z110x1z11z011xz0110zz10xzxxzxzxzxzzxzzxxxzxzzzxzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
