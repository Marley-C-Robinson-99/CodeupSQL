#!/bin/bash
cd ${0%/*}

read -p "Hello, this program will create a new file for you to connect easily to a MySQL server from the command prompt simply by executing the product of a few questions. Would you like to continue? (Y/N)" a1

if [[ $a1 == 'y' ]] || [[ $a1 == 'Y' ]]
then
    printf "Please enter your credentials, the output will be stored locally in whatever directory you open this in."
    read -p 'Please enter the Host ID:' hostidvar
    read -p 'Username:' uservar
    read -sp 'Password' passvar
    echo "#!/bin/bash" >> $hostidvar.sh
    echo "HID='$hostidvar'" >> $hostidvar.sh
    echo "user='$uservar'" >> $hostidvar.sh
    echo "pass='$passvar'" >> $hostidvar.sh
    echo "mysql -u \$user -p\$pass -h \$HID" >> $hostidvar.sh
elif [[ -z $hostidvar ]] || [[ -z $uservar ]] || [[ -z $passvar ]]
then
    exit 1
fi
