#https://mp.weixin.qq.com/s/7pfE3S-uDSLOG1AZSj3D1A

grep: 行过滤工具
  -i  忽略大小写
  -v  查找不包含指定内容的行，反向选择
  -w  按单词搜索，精确匹配单词
  -c  打印出匹配的行数，仅仅显示出匹配的总行数
  -n  打印匹配行的同时，显示匹配行所在的行号
  -A  打印匹配行及其后面多上行
  -B  打印匹配行及其前面多少行
  -C  打印匹配行及其前后多少行
  -l  只列出匹配的文件名
  -L  只列出不匹配的文件名
  -o  仅仅打印匹配到的关键字，比如grep -o GSS xxx.txt  ，仅仅打印GSS
  -P  使用Perl正则表达式
  -E  使用扩展正则表达式
  ^key  以key关键字开头的行
  key$  以key关键字结尾的行
  ^$    空行

cut：列截取工具
  -c  以字符为单位进行截取，分隔
  -d  自定义分隔符，默认\t
  -f  仅截取出指定的区域

  cut -d: -f1 test.txt  以:作为分隔符，仅仅截取出第一列
  cut -d: -f1,6 test.txt  以:作为分隔符，仅仅截取出第一、六列
  cut -c4 test.txt  截取出每行第4个字符
  cut -c-4 test.txt  截取出每行第1至4个字符
  cut -c5- test.txt  截取出每行第5至末尾的字符
  cut -c4-10 test.txt 截取出每行第4至10字符

sort：排序命令，从首字符向后，依次按ASCII码值进行比较，最后将他们按照升序进行比较
  -u  去除重复行
  -r  降序排序，reverse
  -o  排序结果输出到文件
  -t  分隔符
  -k  第N列

  sort -n -t: -k3 test.txt  以：为分隔符，按照数字排列第3列

uniq：去除重复的行
  -c  仅仅计算重复的行
  -i  忽略大小写
  -d  只显示重复行

tee：从标准输入读取，并写入标准输出和文件，双重输出
  -a  追加到文件，默认是覆盖写

diff：逐行比较两个文件

tr：字符转换、替换和删除

#打印paaswd文件当中非root用户名、密码和默认shell
cat test.txt  |grep -v root |cut -d: -f1,2,7 |tr ':' '\t'
bin	x	/sbin/nologin
daemon	x	/sbin/nologin
adm	x	/sbin/nologin

#截取当前主机IP；截取NETMASK；截取广播地址；截取MAC地址