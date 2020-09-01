class c_91_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_91_1;
    c_91_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10z0z0z0011zz1xxzx11xz0x0xxz0x0xzzxzxxzzzxxzzzxzxzxxxzxzzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
