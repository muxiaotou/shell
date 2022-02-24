grep:
-o  仅仅打印匹配的部分，默认打印匹配后的行
-E  实现正则表达式的OR('|')操作，grep -E 'AAA|BBB' test.txt
-v  实现正则表达式的NOT，查找不匹配的行
-P  使用Perl正则表达式，比如\d  ,
-i  忽略大小写