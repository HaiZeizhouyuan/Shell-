#!/bin/bash

#变量的命名规范
#EOF/!/'
:<<!
英文字母，下划线， 数字， 首个字母不能以数字开头
中间不能有空格，可以使用下划线
不能用bash里的关键字
!

#变量与等号之间不能有空格
your_name="runoob.com"
echo ${your_name}

#只读变量
readonly your_name
#error: your_name="goole"

echo ${you_name}

#删除变量mZunset your_name
#error: echo ${your_name}


str="this is a string"
echo ${str}
str="Hello, I know you are  \"$your_name\"!\n"
echo -e ${str}

#获取字符串的长度
string="abcd"
echo ${#string}

string="runoob is a great site"
echo ${string:1:4}
#'是反引号， 而不是单引号
#输出字母i或o的位置（那个字母先出现就计算哪个）
echo `expr index "$string" io`

#数组
array_name=(value0 value1 value2 value3)
array_name[10]=value10
echo ${array_name[0]} ${array_name[10]}
array_name[0]=value00
echo ${array_name[0]}
valuen=${array_name[10]}
echo ${valuen}
#使用@来获取数组中的所有元素
echo ${array_name[@]}

#获取数组的长度
len=${#array_name[@]}
length=${#array_name[*]}
echo ${len} 
echo ${length}
