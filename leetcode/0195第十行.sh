awk '{if(NR==10)print $0}' test.txt
sed -n '10p'  test.txt
grep -n "" test.txt |grep  '^10' |cut -d: -f2-
cat test.txt |head -n 10 |tail -n 1