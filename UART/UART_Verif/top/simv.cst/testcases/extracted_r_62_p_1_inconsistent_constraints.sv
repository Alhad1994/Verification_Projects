class c_62_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_62_1;
    c_62_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z010zx1z1x11xx00zxz1z11xzz0xz0z0zzzxzxxzxxxzzzzxxxxxxxxxxzzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
