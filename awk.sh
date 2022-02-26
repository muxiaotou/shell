  awk：
  -F  定义字符的分隔符，默认的分隔符是空格

  awk内部相关变量：
  NF 当前记录的字段数(列数)  awk '{print NF}' test.txt   field
  $NF 最后一列
  $1,$2...$n 文件中每行以间隔符号分隔的不同字段
  FNR NR 行号   record