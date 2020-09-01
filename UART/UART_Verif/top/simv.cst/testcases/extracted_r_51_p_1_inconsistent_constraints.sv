class c_51_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_51_1;
    c_51_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz00x1z01xzz01xxx100111zzz01xz1xzzzzzzxzxzzxzxxxzzxzxzzzxzxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
