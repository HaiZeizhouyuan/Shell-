#!/bin/bash

# read -p -t -n1 -s 
## 14.6.1 基本的读取
### read

echo -n "Enter your name :"
read name
echo "Hello $name, welcome to my program."


### read -p 提示符


read -p "Please enter your agee : " age

days=$[ $age * 365 ]
echo "That makes you over $days days old!"

# read命令不指定变量 read会将读到的数据存入环境变量REPLY中
read -p "Enter your name : "

echo 
echo Hello $REPLY,  welcome to my program.

### read -t 计时
if read -t 5 -p "Please enter your name :" name
then
    echo "Hello $name, welcme to my script"
else
    echo
    echo "Sorry, too slow!"
fi

#### -n1 输入一个字符后， 不用按回车直接执行命令
read -n1 -p "Do your want to continue [Y/N]?" answer
case $answer in
Y | y) echo
       echo "fine,  continue on..";;
N | n)  echo
        echo OK, goodbye
        exit;;
esac
echo "This is the end of the script"

#### read -s :隐藏
read -s -p "Enter your password " pass
echo 
echo "Is your password really $pass? "

### read file

count=1
cat test | while read line
do  
    echo "Line $count : $line"
    count=$[ $count + 1 ] 
done
echo "Finished processing the file"
