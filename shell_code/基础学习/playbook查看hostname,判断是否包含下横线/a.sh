echo $a | grep '_'
if [ `echo $?` == 0 ];then
  echo "下划线存在."
else
  echo "下划线不存在."
fi
