/bin/ls *.tar.gz > ls.list
for i in `cat ls.list`
do
        /bin/tar -xf $i
done
/bin/rm ls.list
