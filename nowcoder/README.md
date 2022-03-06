    https://www.nowcoder.com/exam/oj?tab=SHELL%E7%AF%87&topicId=195

    # 统计文件行数
    wc -l 
    awk 'END{print NR}' nowcoder.txt
    cat -n
    sed -n '$=' e.txt

    # 打印最后5行
    head -n 5 nowcoder.txt
    tail -n 5 nowcoder.txt
    
    sed -n '5,20p' nowcoder.txt  打印5~20行

    #打印第5行内容
    sed -n '5p' nowcoder.txt 打印第5行
    cat nowcoder.txt |head -n 5 |tail -n 1

    # $后的括号
    （1）${a} 变量a的值, 在不引起歧义的情况下可以省略大括号。
    （2）$(cmd) 命令替换，和`cmd`效果相同，结果为shell命令cmd的输，过某些Shell版本不支持$()形式的命令替换, 如tcsh。
    （3）$((expression)) 和`exprexpression`效果相同, 计算数学表达式exp的数值, 其中exp只要符合C语言的运算规则即可, 甚至三目运算符和逻辑表达式都可以计算

    # 打印倍数
    [root@chenli ~]# cat a.sh 
    #!/bin/bash
    
    for i in `seq 0 500`;do
    #let tmp=$i%7
    tmp=$(($i%7))
    if [ $tmp -eq 0 ];then
    echo $i
    fi
    done

    # 去掉空行
    grep -v '^$' nowcoder.txt
    grep -e '\S' nowcoder.txt   //元字符\S，指匹配任意非空字符，\s指匹配任意空字符
    awk '{if($0 != "") {print $0}}' nowcoder.txt
    sed '/^\s*$/d' nowcoder.txt

    #打印空行行号
    grep -n '^\s*$' nowcoder.txt
    awk '/^\s*$/{print NR}' nowcoder.txt
    sed -n '/^\s*$/=' nowcoder.txt    -n是静默输出，忽略内容输出   = 打印行号

    #打印行号
    awk '{print NR,$0}' nowcoder.txt
    cat -n nowcoder.txt

    #打印单词长度
    例如文本内一行单词： how they are implemented and applied in computer 
    awk '{for(i:=1;i<=NF;i++) if(length($i)<8) {print $i}}' recoder.txt  //使用awk的length函数
    或者写个for循环，for ele in `cat recoder.txt`;do if [ ${#ele} -lt 8 ];then echo ${ele};fi;done   //使用${#ele} #表示字符个数

    #计算ps -aux后，某一列数值的总和
    sum=0;for i in `awk '{print $6}' c.txt`;do let sum=sum+$i;done;echo ${sum}
    其中算数运算let sum=sum+$i,等价于  let sum+=$i\ ((sum+=$i)) \sum=$((sum+$i))
    awk '{sum+=$6}END{print sum}' c.txt
    awk 'BEGIN{sum=0}{sum+=$6}END{print sum}' c.txt

    #打印重复行的行数
    cat d.txt |awk '{print $2}'|sort |uniq -c |grep -v 1    //uniq  -c 打印重复的行数  

    #多行求平均值
    awk '{if(NR==1){N=$1} else{sum+=$1}} END {printf ("%.3f", sum/N)}' e.txt 

    #匹配判断
    if [[ ${aaa} =~ [bB] ]];then echo "OK";fi    //=~ 匹配判断
    while read line;do if [[ ${line} =~ [Bb] ]];then echo ${line};fi;done < f.txt   //打印文件匹配行出来

    #判断是否是ip地址
    #!/bin/bash

    IFS='.'
    while read line;do
    arr=(${line})
    if [ ${#arr[*]} -ne 4 ];then
    echo "error"
    else
    for ((i=0;i<${#arr[*]};i++));do
    if [ ${arr[i]} -gt 255 ];then
    echo "no"
    break
    fi
    done
    [ $i -eq 4 ]  && echo "yes"
    
        fi 
    done< g.txt

    #array[*] 和array[@]区别，如果使用两个时，数组变量外未加“”双引号，两个都是数组，如果加了“”双引号，*会当做一行处理
    [root@chenli ~]# sh array.sh 
    ***
    @@@
    @@@
    @@@
    @@@
    [root@chenli ~]# cat array.sh
    #!/bin/bash
    
    a=(aa bb cc dd)
    
    for i in "${a[*]}";do
    echo "***"
    done
    
    for i in "${a[@]}";do
    echo "@@@"
    done

    #倒序打印passwd文本
    awk -F':' '{for(i=NF;i>0;i--) if(i==1){printf("%s\n", $i)}else{printf("%s:",$i)}}' h.txt

    TODO  SHELL18


    
    

    

