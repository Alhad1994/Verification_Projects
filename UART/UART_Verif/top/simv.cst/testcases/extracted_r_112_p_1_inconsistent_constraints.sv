class c_112_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_112_1;
    c_112_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z010xx11110xz1xx0z01zxz1101x0100zxxxzxxxzzzzzzzxxxzzzzzzzxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
