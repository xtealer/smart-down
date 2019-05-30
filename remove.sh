#if you want to delete all the files and disable the script on startup you have just to run this.

echo "Removing files..."
sleep 2

systemctl stop smartdown
systemctl disable smartdown
rm -r /lib/smart-down
rm /var/log/smartdown.log
rm /lib/systemd/system/smartdown.service

echo "done!"
