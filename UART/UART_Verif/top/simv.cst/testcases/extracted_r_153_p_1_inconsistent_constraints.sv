class c_153_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_153_1;
    c_153_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00xxz0zx000x000zx0zz010z1zz1z0zxzzzzzzzxzzxxxxxxzxzzzxzxzzxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
