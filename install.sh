#script to install the service and run it, must be made executable (~# chmod +x install.sh)

touch /var/log/smartdown.log
mkdir ~/.scripts
cp smartdown.sh ~/.scripts/
cp smartdown.service /lib/systemd/system/
chmod +x ~/.scripts/smartdown.sh
chmod +x /lib/systemd/system/smartdown.service
systemctl enable smartdown
systemctl start smartdown
printf "\n\n\n"
systemctl status smartdown
echo "done! Ready to try."
