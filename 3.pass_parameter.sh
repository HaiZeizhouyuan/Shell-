#!/bin/bash 
echo "Shell 传递参数实例"
echo "执行的文件名 ：$0"
echo "第一个参数：$1"
echo "第二个参数：$2"
echo "第三个参数就：$3"

echo "参数的个数为: $#"
echo "参数有：$*"
echo "命令的退出状态： $?(0:无错)"

echo "--\$* 演示---"
for i in "$*"; do
    echo $i
done
echo "--\$@演示--"
for i in "$@"; do
    echo $i
done

echo "当前运行的进程ID号:$$"
echo "后台运行的最后一个ID号: $!"
echo "$-"

if [ -n "$1" ]; then
    echo "包含第一个参数"
else
    echo "没有包含第一个参数"
fi
