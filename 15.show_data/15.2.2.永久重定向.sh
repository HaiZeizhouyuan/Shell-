#!/bin/bash

:<<!
exec 0 < stdinfilename
exec 1 > outfilename
exec 2 > errfilename
exec 3 > 
exec 0 < testfile
!

:<<!
count = 1
while read line
do
    echo "Line #$count : $line"
    count = $[ $ount + 1 ]
done
!

:<<!
exec 1>testout
echo "This is a test of redrecting all output"
echo "from a script to another fil"
echo "without having to redirect every individual line"
!

:<<!
exec 2>testerror
echo "This is the start of the script"
echo "now redirecting all output to another location"
exec 1>test1out
echo "this output should go to the testout file"
echo "but this should go to the testerror file">&2
!

:<<!
exec 3>testfile
echo "This should display on the monitor"
echo "and this should be stored in  the file" >&3
echo "Then this should be  back on the monitor"
!
# 15.4.2 重定向描述符

exec 3>&1
exec 1>test4out

echo "this is should store in the output file"
echo "along with this line"
exec 1>&3
echo "now things should be back to normal"


