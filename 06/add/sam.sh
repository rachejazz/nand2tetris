while read line
do 
        echo "ibase=2; `echo $line`" | bc 
        done < $@
