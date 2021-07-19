#!/bin/bash
###################################################
# local machine login remote machine without secret
####################################################

# install expect package
function expect_pkg() {
    rpm -qa | grep expect
    if [ $? -eq 1 ];then
        yum install expect -y
    fi
}

# copy public key to remote machine
function scp_key() {
    while read line;do
        if [[ $line =~ ^# ]];then
            continue
        fi

        ip=`echo $line | awk '{print $1}'`
        user=`echo $line | awk '{print $2}'`
        passwd=`echo $line | awk '{print $3}'`

        expect <<EOF
            set timeout 10
            spawn ssh-copy-id -f $user@$ip
            expect {
                "yes/no" { send "yes\n";exp_continue }
                "password" { send "$passwd\n" }
            }
            expect "password" { send "$passwd\n" }
EOF
    done < $1
    }

# usage
function usage() {
    echo "Usage:"
    echo "passwordless.sh -f HOSTS"
    echo ""
    echo "Descrition:"
    echo "-f , host list file, eg:"
    echo "      #ip         user    password"
    echo "      10.0.0.11   root    123456"
    echo "      10.0.0.12   mutou   111111"
}

# must provide at least one param
if [ $# -eq 0 ];then
    usage
    exit
fi

# params analysis
while getopts Af: opt;do
    case $opt in
        f)
            host_file=${OPTARG};;
        h)
            usage
            exit
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

# generate authentication
if [ ! -f ~/.ssh/id_rsa ] || [ ! -f ~/.ssh/id_rsa.pub ];then
    ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
fi

# main
expect_pkg
scp_key ${host_file}