#!/bin/bash
#
val=`expr 2 + 2`
echo "两数之和：$val"
val=`expr 2 - 2`
val=`expr 2 \* 2`
val=`expr 2 / 2`
val=`expr 2 % 2`
a=$val
b=4
echo ${a}
if [ $a==$val ]
then
    echo "equal"
fi

if [ $a!=$b ]
then
    echo "no equal"
fi

