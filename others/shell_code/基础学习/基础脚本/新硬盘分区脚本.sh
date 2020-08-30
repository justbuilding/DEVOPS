#!/bin/bash

echo "================================================================================"
echo "                We Are Going To Make Partition For New Disk"
echo "================================================================================"
echo "Please choose the disk to make partition"
echo "--------------------------------------------------------------------------------"
fdisk -l | grep -o "/dev/sd." |sort | uniq | nl | tee disk_file.tmp
read -p "which disk to make partition (please choose the number) : " Disk_Id
echo "================================================================================"
Disk_mk=$(grep "^[[:space:]]\+$Disk_Id" disk_file.tmp |tr -s "[:space:]" "%" |cut -d "%" -f 3)
echo " You choose is $(grep "^[[:space:]]*$Disk_Id" disk_file.tmp),     please refer to the below information"
sleep 1
fdisk -l $(grep "^[[:space:]]\+$Disk_Id" disk_file.tmp |tr -s "[:space:]" "%" |cut -d "%" -f 3)
read -p "Please confirm your choose , y /n ? " Disk_Com
if [[ "$Disk_Com" == "n" ]];then
	echo "re-excute the script!!"
	exit 110
fi
#########################################
# 开始分区
########################################
echo "================================================================================"
echo "NOte: the max sum of extent and primary partition is 4!"
echo -e "\tif the extent partition is made, the type partition must be l or p"
echo "================================================================================"
echo "please refer to he information of the disk : $Disk_mk "
lsblk $Disk_mk
fdisk -l $Disk_mk | grep -B 1 "^$Disk_mk" 
Part_No=$(fdisk -l $Disk_mk | grep  "^$Disk_mk"|wc -l ) 
#检查已经分区数
if [ $Part_No -eq 0 ];then
	echo "This Disk is no any partition."
	else
	echo "This Disk is not new Disk"
fi
############################################
echo "================================================================================"
echo -e "\t\t\tBegin..."
############
Size_To=$(lsblk $Disk_mk |grep -o "\<[[:digit:]]\+G" | cut -d G -f1 |head -1)
Size_Li=$(lsblk $Disk_mk | wc -l)
if [ $Size_Li  -eq 2 ];then
	Size_Dk=0
	else
	Size_Dk=$[$(lsblk $Disk_mk |grep -v "^[[:alpha:]]" |grep -o "\<[[:digit:]]\+G" |cut -d G -f1|tr "\n" "+")0]
fi	
while [[ "$Disk_Com" == "y" ]]
	do
		Size_L=$[${Size_To}-${Size_Dk}]
		if [ $Size_L -le 0 ] && ! fdisk -l $Disk_Com |grep "\<Extended\>" &> /dev/null;then
			echo "There is no free size to make partition"
			exit 130
		fi
		#显示已分区信息
		echo "This disk partition info is below: "
		lsblk $Disk_mk
		##判定已分区类型

		if [ $Part_No -lt 4 ];then
			echo "The num. of partitions is less than 4"
			if  fdisk -l $Disk_Com |grep "\<Extended\>" &> /dev/null;then
				echo "The type == e == is not allowded!"
				echo "please input == l ==  or == p =="
			else 
				echo "please input == e == or == p =="
			fi
		else
			echo "The num. of partition is greater or equal 4."
				if  fdisk -l $Disk_mk |grep "\<Extended\>" &> /dev/null;then
				echo "Only type == l == is allowed."
				else
					echo "The Disk isn't allowd to make partition, and quite the Script"	
					exit 120
				fi
		fi
	##
	## 分区大于4时
		if [ $Part_No -ge 4 ];then
			echo "	The no of logical partition is auto created  by system	"
			read -p "请输入分区大小 （注意这里默认单位为G）： " Part_Size
			echo "请注意磁盘剩余容量！"
			echo -e "n\n\n+${Part_Size}G\nw\n"|fdisk $Disk_mk > /dev/null
			partx -a $Disk_mk
			Size_Dk=$[$Size_Dk+$Part_Size]
			read -p "是否继续分区？y/n : " Disk_Com
		else
			read -p " 请输入分区类型 ：" Part_Tp				
			read -p "请输入分区号（1-4）: " Part_N 
			until [ $Part_N -le 4 ]
				do 
					read -p "请输入分区号（1-4）: " Part_N
				done	
			echo "The free size of $Disk_mk is $Size_L G"
			read -p "请输入分区大小或者默认回车 （注意这里默认单位为G）： " Part_Size
			if [[ -n "$Part_Size" ]];then
				echo -e "n\n${Part_Tp}\n${Part_N}\n\n+${Part_Size}G\nw\n" | fdisk $Disk_mk > /dev/null
			else
				echo -e "n\n${Part_Tp}\n${Part_N}\n\n\nw\n" | fdisk $Disk_mk > /dev/null
				Part_Size=$Size_L
			fi			
			partx -a $Disk_mk
			Size_Dk=$[$Size_Dk+$Part_Size]
			read -p "是否继续分区？y/n : " Disk_Com
		fi		
done
rm -rf  disk_file.tmp
echo "================================================================================"
echo "分区结束！ 以下为$Disk_mk 的分区信息："
fdisk -l $Disk_mk |grep -B 1 "^$Disk_mk"
echo "================================================================================"
#############################################################
#显示分区信息
#
read -p "你想修改分区系统类型吗？ y/n :" Sys_com
if [[ "$Sys_com" == "y" ]];then
	echo "开始修改。。。"
	else 
	echo "good bye"
	exit
fi
###############
#修改分区
while [[ "$Sys_com" == "y" ]]
	do 
		echo "================================================================================"
		read -p "请输入要修改的分区号： " Sys_No
		echo -e "l\nq\n" | fdisk $Disk_mk | grep -A 25 "\<Empty\>"
		read -p "请输入要修改的类型： " Sys_Tp
		echo -e "t\n${Sys_No}\n${Sys_Tp}\nw\n" | fdisk $Disk_mk &> /dev/null
		echo "修改后的信息："
		echo -e "p\nq\n" fdisk $Disk_mk
		read -p "继续修改分区系统类型吗？ y/n :" Sys_com
		
done
echo "BYEBYE" 
