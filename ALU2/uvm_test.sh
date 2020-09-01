for i in {0..9}; 
do  
  mycmd=(./sv_uvm top.sv \"alu${i}.svp\")
  echo $i
  "${mycmd[@]}" >> results/output${i}.txt  
done
