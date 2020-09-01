class c_178_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_178_1;
    c_178_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x0zx110x1z11z00x1z00xx0011zzz0xzxxzxzzxxzxxxxzxxzxzxzxzzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
