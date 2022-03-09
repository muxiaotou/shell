  https://mp.weixin.qq.com/s/rIvOa5yvXFCAWiidxFz_ug

  awk：逐行扫描文件进行处理
  awk 选项 ”命令部分“ 文件

  常用选项：
  -F  定义字符的分隔符，默认的分隔符是空格
  -v  定义变量并赋值

  命令部分：
  awk内部相关变量：
  NF 当前记录的字段数(列数)  awk '{print NF}' test.txt   field
  $NF 最后一列
  $1,$2...$n 文件中每行以间隔符号分隔的不同字段
  FNR NR 行号   record

  #匹配打印
  awk '/root/{print $0}' /etc/passwd      //$0指代整行
  awk '/root/' /etc/passwd   //也可以实现上述功能
  awk 'NR==1,NR==5{print $0}' /etc/passwd   //打印第1到5行

  awk 'BEGIN{...}{语句}END{...}' /etc/passwd  //BEGIN在程序开始前执行，END所有文件处理完后执行

