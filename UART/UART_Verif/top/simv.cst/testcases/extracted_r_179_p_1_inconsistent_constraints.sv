class c_179_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_179_1;
    c_179_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1101zxx1z1x010z1zz0z1xz0110zzxzzzzxxzxzzxzxzxxzzzzxzxxxzzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
