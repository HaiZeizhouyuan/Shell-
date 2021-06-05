#!/bin/bash

num1=10
num2=10
if test $[num1] -eq $[num2]
then
    echo "两数相等"
else 
    echo "两数不等"
fi

:<<EOF
相等：-eq
不相等：-ne
>:-gt
>=:-ge
<: -lt
<= : -le
EOF
result=$[2+9]
echo ${result}


num1='rulboob'
num2='runppb'

if test ${num1}=${num2}
then
    echo '字符串相等'
else
    echo '字符串不等'
fi

:<<EOF
=, !=, len=0:-z, len!=0: -n
EOF


if test -e ./bash
then
    echo '文件已存在'
else 
    echo '文件不存在'
fi

:<<EOF
-e:文件存在
-r:存在且可读
-w:存在且可写
-x:存在且可执行
-s:文件存在且至少有一个字符
-d：文件已存在且为目录
-f：为普通文件
-c：为字符型特殊文件
-b：为块特殊文件
EOF

if test -e ./file1 -o -e ./file2
then
    echo 'both exit'
else 
    echo 'all not exit'
fi
#-o： 或， -a:且, !:非，优先级依次增高




url="http://www....com"
