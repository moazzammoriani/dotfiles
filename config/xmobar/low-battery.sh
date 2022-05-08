state=`cat /sys/class/power_supply/AC/online`
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if [ $capacity -le 13 ] && [ $state != 1 ]; then 
    zenity --warning --text="Battery low! Charge your device" 
fi
