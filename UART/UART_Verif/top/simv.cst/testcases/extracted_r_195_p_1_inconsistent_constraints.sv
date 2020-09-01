class c_195_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_195_1;
    c_195_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z1xx01zxxxxzzxzx0xxx010z0zz1zxzzxxzxxzzzzzzxxxxzxxzxzzzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
