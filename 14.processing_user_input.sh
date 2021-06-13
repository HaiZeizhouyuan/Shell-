#!/bin/bash

## 14.1 处理命令行参数
:<<!
    在参数数量小于等于9时， $1 ~ $9
    在参数数量大于9时，加{}, ${10}, ${11}, ...
    参数的数量$#
    获取最后一个参数${!#}
    $*:将所有的参数当作一个单词保存，  是一个整体
    $@:把所有的参数当成依法字符串， 可通过for得到每个参数
!

### 14.1.1 读取参数
:<<!
factorial=1
for(( number = 1; number <= $1; number++ ))
do
    factorial=$[ $factorial * $number  ]
done
echo The factorial of $1 is $factorial

total=$[ $1 * $2 ]
echo The first parameter is $1
echo The second parameter is $2
echo The total value is $total

echo Hello $1, glod to meet you

total=$[ ${10}*${11} ]
echo The tenth parameter is ${10}
echo The eleventh parameter is ${11}
echo The total value is $total
!
### 14.1.2 读取脚本名
:<<!
##不包含路径的脚本名name=$(basename $0)
echo The zero parameter is set  to: $0
name=$(basename $0)
echo "The zero parameter is set to : $name"

name=$(basename $0)
if [ $name = "addem" ]
then
    total=$[ $1 + $2 ]
elif [ $name = "multem" ]
then
    total=$[ $1 * $2 ]
fi
echo 
echo The calculated value is $total
!
### 14.1.3 测试参数
:<<!
if [ -n "$1" ]
then
    echo Hello $1, glad to meet you.
else
    echo "Sorry, did not identify yourself."
fi 
!
## 14.2 特殊参数变量
##14.2.1 参数统计
:<<!
echo There were $# parameter supplied
if [ $# -ne 2 ]
then
    echo
    echo Usage: 14.processing_user_input.sh a b
    echo 
else 
    total=[ $1 + $2 ]
    echo 
    echo The total is $total 
    echo
fi 

echo The last parameter was ${!#}

## 14.2.2 抓取所有的数据
echo "Using the \$* method:$*"
echo 
echo "Using the \$@ method $@"
echo 

echo
count=1
for param in "$*"
do
    echo "\$* parameter #$count = $param"
    count=$[ $count + 1 ]
done

echo
count=1
for param in "$@"
do
    echo "\$@ parameter #$count = $param"
    count=$[ $count + 1 ]
done
!
## 14.3 移动变量 
:<<!
参数的数量未知, 值一旦被移除就无法恢复
!
:<<!
echo "14.3 移动变量"
echo
count=1
while [ -n "$1" ]
do
    echo "parameter #$count = $1"
    count=$[ $count + 1 ]
    shift
done
!
### 14.4.1 查找选项
###### 1.处理简单选项
:<<!
echo
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option" ;;
        -b) echo "Found the -b option" ;;
        -c) echo "Found the -c option" ;;
        *) echo "$1 is not an option" ;;
    esac
    shift 
done
!

###### 2.分离参数和选项
:<<!
echo 
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) echo "Found the -b option";;
        -c) echo "Found the -c option";;
        --) shift
            break;;
        *) echo "$1 is not an option";;
    esac 
    shift
done

count=1
for param in $@:
do
    echo "parameter #$count :$param"
    count=$[ $count + 1 ]
done
!

##### 3.处理带值的选项
:<<!
echo 
while [ -n "$1"  ]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) param="$2"
            echo "Found the -b option, with parameter value $param"
            shift ;;
        -c) echo "Found the -c option";;
        --) shift
            break;;
        *) echo *$1 is not an option;
    esac
    shift 
done
!

### 14.4.2 使用getopt命令
:<<!
getopt optstring parameters
!

##getopt ab::cd -a -b test1 -cd test12 test3

## set -- $(getopt -q ab:cd "$@")
set -- $(getopt -q ab:cd "$@")

echo
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option ";;
        -b) param="$2"
            echo "Found the -b option, with parameter value $parama"
            shift;;
        -c) echo "Found the -c option";;
        --)shift
            break;;
        *) echo "$1 is not  an option";;
    esac
    shift;;
done
count=1
for param in $@
do
    echo "parameter #$count: $param"
    count=$[ $count + 1 ]
done

## getopts

echo
while getopts :ab:c opt 
do
    case "$opt" in
        a) echo "Found the -a option" ;;
        b) echo "Found the -b option" ;;
        c) echo "Found the -c option" ;;
        *) echo "Unknow option: $opt";;
    esac
done 
