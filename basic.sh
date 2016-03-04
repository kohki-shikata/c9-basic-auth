#!/bin/sh

echo "Create .htaccess and .htpasswd for basic auth"

# cloud9 doesn't have htpasswd command currently.
sudo apt-get update
sudo apt-get install apache2-utils --fix-missing

BASE_PATH=`pwd`
cat <<EOF > .htaccess
AuthUserfile $BASE_PATH/.htpasswd
# AuthGroupfile /dev/null
AuthName "Please enter your ID and password"
AuthType Basic
require valid-user
EOF

echo -n "New ID:"
read USER_ID
htpasswd -c $BASE_PATH/.htpasswd $USER_ID

echo "change chmod 604.htaccess and  .htpasswd"
sudo chmod 604 .htpasswd .htaccess
