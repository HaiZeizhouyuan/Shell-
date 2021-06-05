#!/bin/bash
string="hello world"
echo string
echo "It is a test"

echo \"It is a test\"

#输入
read name
echo "my name is ${name}"
#换行：-e \n
echo -e "I like world\n"
#不换行: -e \c 
echo -e "it is a test!\c"
echo "Ok"
echo "It is a test" > myfile
echo '$name\"'
# 反引号
echo `date`

