#!/bin/bash

if condition
then
    command1
    command2
    command3
else
    command5
fi

if condition
then
    command1
    command2
    command3
elif condition2
then
    command4
else
    command5
fi

for var in item1 item2 item3
do
    command1

done

int=1
while(( $int=5 ))
do
    echo $int
    let "int++"
done

while true
do
    command1
done

for (( ; ; ))


until condition
do command1

done

a=0

until [ !$a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done

read val
case ${val} in
    1) 
        echo 'you select 1'
        ;;
    2)
        echo 'you select 2'
        ;;
    *) echo 'you no selct between one to four'
esac

break
continue
