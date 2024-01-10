#!/bin/sh

NAS="192.168.1.103"
NAS_ALT="nas-ds923.home"

unix_user=$(whoami)

echo "=== NAS Auth ==="
read -p "Username: " username
read -s -p "Password: " password
echo

smbclient -L $NAS --user=$username --password=$password

if [ $? -ne 0 ]; then
	echo
	echo "Failed to connect to $NAS: Invalid username/password"
else
	echo
	read -p "Network share: " share

	# uid is needed to correctly setup file permissions and allow the current user to edit the remote files
	sudo mount --mkdir -t cifs "//$NAS/$share" "/mnt/nas/$share" -o uid=$unix_user,username=$username,password=$password,vers=2.0
fi
