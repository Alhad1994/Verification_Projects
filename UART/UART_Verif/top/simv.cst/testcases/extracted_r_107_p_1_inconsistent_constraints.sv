class c_107_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_107_1;
    c_107_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xzxx10xz1z0011xxxxx0x0zz00101xxxzxxzxzzzzzzzxzxzxzzxzzxzzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
