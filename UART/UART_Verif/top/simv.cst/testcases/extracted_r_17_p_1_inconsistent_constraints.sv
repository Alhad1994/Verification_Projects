class c_17_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_17_1;
    c_17_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1z110xzx0101z10xx111xx0zzx00z0xxxxzxxxzxxxzxxzzxxzzzzzxzxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram