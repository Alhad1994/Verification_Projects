class c_93_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_93_1;
    c_93_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "101z0z0z10zzx110x10xx1xxzzxz1x1xzzzxxzxzxzxxzxzxxxzzzzzxzxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
