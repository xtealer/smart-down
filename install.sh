#script to install the service and run it, must be made executable (~# chmod +x install.sh)

touch /var/log/smartdown.log
mkdir /lib/smart-down
cp smartdown.sh /lib/smart-down/
cp smartdown.service /lib/systemd/system/
chmod +x /lib/smart-down/smartdown.sh
chmod +x /lib/systemd/system/smartdown.service
systemctl enable smartdown
systemctl restart smartdown
printf "\n\n\n"
systemctl status smartdown
echo "done! Ready to try."
