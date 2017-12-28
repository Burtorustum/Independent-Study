#!/bin/bash
if [ "$(id -u)" != "0" ]
	then echo $'The installer has to be run as root.\nYou must enter "sudo ./driver_installer.sh"'
	exit
fi

wget -q --tries=10 --timeout=10 --spider http://github.com
if [[ $? -ne 0 ]]
	then echo "You need to be online to run the installer"
	exit
fi

sudo apt-get install unzip build-essential python-dev

LIBRARY_URL="https://github.com/julianoks/Adafruit_Python_PCA9685/archive/master.zip"
DIR=/usr/lib
TMP=`mktemp`
wget $LIBRARY_URL -O $TMP
unzip -d $DIR $TMP
rm $TMP

sudo python /usr/lib/Adafruit_Python_PCA9685-master/setup.py install
echo 'export PYTHONPATH="${PYTHONPATH}:/usr/lib/Adafruit_Python_PCA9685-master/Adafruit_PCA9685"' >> /home/pi/.bashrc
source /home/pi/.bashrc