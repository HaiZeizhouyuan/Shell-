#!/bin/bash
#13 more_struct command 
##13.1
for var in list
do
    command
done

### 13.1.1 读取表中的值
for test in Alabama Alaska Arizona Callfofrna Colorada
do 
    echo ${test}
done 
echo $test

### 13.1.2 读取表中的复杂值
for test in I don't know if this'll work
do
    echo ${test}
done

for test in I don\'t know if "this'll" work
do
    echo ${test}
done

for test in new one new two new three
do
    echo ${test}
done

for test in "new one" "new two" "new three"
do
    echo ${test}
done

### 13.1.3 从变量中读取列表

list="one two three four five"
list=${list}" six"
for num in ${list}
do
    echo ${num}
done 

### 13.1.4 从命令读取指
file="./"
for state in $(ls $file)
do
    echo "shell file have $state"
done

### 13.1.5 更改字段分隔符
#IFS(分隔符)
#如果要指定多个IFS字符，只要将他们在赋值时串起来就行。IFS=$'\n':':'

file="./state"

IFS=$'\n'
for num in $(cat $file)
do
    echo $num
done

### 13.1.6 用通配符读取目录
for file in ~/yuanzhou/LUA/* ~/yuanzhou/Shell-/*
do
    if [ -d "$file" ]
    then
        echo "file is a directory"
    elif [ -f "$file" ]
    then
        echo "file is a directory"
    fi
done   


## 13.2 C语言风格的for命令
## for (( variable assignment;  condition; ieration process ))

### 13.2.1 C语言的for 风格
for((  i= 0; i < 10; i++ )){
    echo $i
}

### 13.2.2 使用多个变量
for(( a = 1, b = 0; a < 10; a++, b++  )) {
    echo "a: $a, b ; $b"
}

# 13.3 while
##13.3.1的基本格式
:<<!
    while test command
    do
        other commands
    done
!

var1=10
while [ $var1 -gt 0 ]
do
    echo $var1
    var1=$[ $var1 - 1 ]
done

## 13.3.2

var1=10
while echo $var1 
    [ $var1 -ge 0 ]
do
    echo "This is inside the loop"
    var1=$[ $var1-1 ]
done

## 13.4 until
:<<!
until test commands
do
    other command
done

util test command1
    test command2
do
    other command
done
多个测试命令时，会在最后一个命令成立时停止 
!

var1=100
until [ $var1 -eq 0 ]
do
    echo $var1
    var1=$[ $var1 - 25 ]
done

echo "while more command"
var2=100
var3=10

until echo "var2 $var2"
    echo "var3 $var3"
    [ $var3 -eq 0 ] || [ $var2 -eq 0 ]
do 
    var2=$[ $var2 - 25 ]
    var3=$[ $var3 - 1 ]
done

## 13.5 嵌套循环
echo -e "\n##  13.5 嵌套循环\n"
for(( a = 1; a <= 3; a++ ))
do
    echo "Starting loop $a:"
    for (( b = 1; b <= 3; b++ ))
    do
        echo "      Inside loop : $b"
    done
done 

echo -e "while and for\n"
var1=5
while [ $var1 -ge 0 ]
do
    echo "Outer loop: $var1"
    for (( var2 = 1; var2 < 3;  var2++))
    do
        var3=$[ $var1 * $var2 ]
        echo "      Inner loop: $var1 * $var2 = $var3"
    done
    var1=$[ $var1 - 1 ]
done

echo -e "until and while\n"

var1=3
until [ $var1 -eq 0 ]
do
    echo "Outer loop : $var1"
    var2=1
    while [ $var2 -lt 5 ]
    do
        var2=$[ $var2 + 1 ]
    done
    var1=$[ $var1 - 1 ]
done

## 13.6 循环处理文件数据
echo -e "\n## 13.6 循环处理文件数据"
#???? : IFS.OLD=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd)
do
    echo "Values in $entry -"
    IFS=:
    for value in $entry
    do
        echo "   $value"
    done
done


##13.7 控制循环
### 13.7,1 break命令
echo -n "break for\\n"
echo -e "\n ## 13.7.1 break命令"
for var1 in 1 2 3 4 5 6 7 8 9 10
do
    if [ $var1 -eq 5 ]
    then
        break;
    fi 
    echo "Iteration number: $var1"
done 
echo "The for loop is complated"

echo -e "break while\n"

var1=1
while [ $var1 -lt 10 ]
do
    if [ $var1 -eq 5 ]
    then
        break;
    fi 
    echo "Iteration $var1"
    var1=$[ $var1 + 1  ]
done

#### 跳出内部循环
echo -e "\n #### 跳出内部循环"
for (( a = 1 ; a < 4; a++ ))
do
    echo "Outer loop:$a"
    for (( b = 1; b < 100; b++ ))
    do
        if [ $b -eq 5 ]
        then
            break
        fi
        echo "      echo Inner loop: $b"
    done
done

#### 跳出外部循环
:<<!
    break n
    n=1时跳出当前xunh
    n=2:break命令会停止下一级的外部循环
!
echo -e "\n #### 跳出外部循环"

for (( i = 1; i < 4; i++ ))
do
    echo "Outer loop:$i"
    for (( j = 1; j < 5; j++ )) 
    do 
        if [ $j -gt 4 ]
        then
            break 2
        
        fi
        echo  "      Inner loop:$j"
    done

done

### 13.7.2 continue命令
:<<!
    continue n
!

## 13.8 处理循环的输出

for  file in ~/yuanzhou 
do
    if [ -d "$file" ]
    then
        echo "File is a directory"
    else
        echo "$file is a file"
    fi 
done > output.txt
#done | sort

## 13.9 实例
### 13.9.1

