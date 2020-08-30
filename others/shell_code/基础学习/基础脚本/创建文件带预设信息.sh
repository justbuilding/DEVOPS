#!/bin/bash
#sh test6.sh ab  用test6.sh（当前脚本）创建或替换ab文件附带预设的信息等
#需谨慎使用，会清空源文件
echo -e "#!/bin/bash\n#version:1.0\n#author:jayq \n#Date: $(date +%F)\n" > $1
vi $1
