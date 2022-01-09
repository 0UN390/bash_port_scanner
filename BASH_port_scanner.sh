#!/bin/bash
source ./color

# (ctrl + z) to stop the script

target=$1                                                                              #takes an argument from the user

#ping the target to see if it is up or down
ping=`ping -c 1 $target | grep bytes | wc -l`
if [ "$ping" -gt 1 ];
then
echo -e "\n${green}$target is up\n";
else
echo -e "\n${red}$target is down\n";
exit
fi                                                                                     #end of if condition


#port scanning
echo -e "${purple}SERVICSE              PORT"
#echo -e "${purple}port"
i=1
while [ $i -le 1000 ]
do
(echo >/dev/tcp/$target/$i)   > /dev/null 2>&1 &&  getent services $i

i=$[$i+1]
done
