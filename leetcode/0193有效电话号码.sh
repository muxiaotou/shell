#匹配987-123-4567
grep  "[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}" 1.txt
grep -E  "[0-9]{3}-[0-9]{3}-[0-9]{4}" 1.txt
grep -P "\d{3}-\d{3}-\d{4}" 1.txt

#匹配 (123) 456-7890
grep -E "\([0-9]{3}\) [0-9]{3}-[0-9]{4}" 1.txt
grep -P "\(\d{3}\) \d{3}-\d{4}" 1.txt

#匹配两种类型的电话号码，使用 ( | )
grep -P "(\d{3}-|\(\d{3}\) )\d{3}-\d{4}" 1.txt
