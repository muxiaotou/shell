  https://mp.weixin.qq.com/s/DMC8Ba8GgqZ1rKAIJ-66hA

  sed：stream editor 流编辑器，一行一行读取文件，并按照进行处理

  sed [选项] '处理动作' 文件名
  选项:
  -i 修改文件
  -n 只显示匹配的行，默认会显示所有航

  处理动作：
  p 打印
  sed -n '/root/p' /etc/passwd
  sed -n '1,5p' /etc/passwd

  sed -i 's/ed/bb/g' test.txt