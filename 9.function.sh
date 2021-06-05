#!/bin/bash


myfunc() {
    echo "sun is :$[$1 + $2], name is $3"
    echo "have args : $#, args is : $*, status is $?"
    echo "这是我的第一个shell 函数"
    return $[($1+$2)]

}

echo "函数开始执行"
myfunc 1 5 zy
echo "res : $?"

echo "函数执行完毕"
expr 1 + 1

source ./7.test.sh

echo ${url}
