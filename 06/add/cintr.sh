#!/bin/bash

#x=`echo $@ | sed -r 's|(M)|`$y`|g' 2>dev/null`

while read line
do
        if [ `echo $line | grep -G "^[//\s]" > /dev/null; echo $?` -eq 0 ]
        then
                continue
# echo $line | grep "@" > /dev/null
        elif [ `echo $line | grep "@" > /dev/null ; echo $?` -eq 0 ]
        then 
                hex=20000000000000000
                str=$(echo "obase=2; `echo $line | tr -d [] | cut -f 2 -d "@"`" | bc)
                echo "$(($str+$hex))" | tr -d "2"
                continue       
#echo $line | grep -e ^[AMD] > /dev/null
        elif [ `echo $line | grep "=" > /dev/null ; echo $?` -eq 0 ]
        then
                x=`echo $line| tr -d [] | tr -cd [A-Za-z0-9\+-\|\&\;=@] | cut -f 1 -d "="`
#echo $x
                str=`python3 ~/assignment/scrptest/cinstr.py $x "1" 2>/dev/null`
                y=`echo $line | tr -d [] | tr -cd [A-Za-z0-9\+-\|\&\;=@] | cut -f 2 -d "="`
#               echo $y
                str=`python3 ~/assignment/scrptest/cinstr.py $y "0" 2>/dev/null`$str
                echo 111$str"000"
                continue
        
       elif [ `echo "$line" | cut -f 2 -d "="` = $line ]
       then
                #jmp
                x=`echo "$line" | tr -d [] | tr -cd [A-Za-z0-9\+-\|\&\;=@] | cut -f 2 -d ";"`
                str1=`python3 ~/assignment/scrptest/cinstr.py $x "1" 2>/dev/null`
                #cmp
                y=`echo "$line" | tr -d [] | tr -cd [A-Za-z0-9\+-\|\&\;=@] | cut -f 1 -d ";"`
                str2=`python3 ~/assignment/scrptest/cinstr.py $y "0" 2>/dev/null`
                echo 111"$str2"000"$str1"
                continue
      else
                continue
      fi
      sleep 1
done

