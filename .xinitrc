#bash /home/daniel/git/dwm-bar/dwm_bar.sh
nitrogen --restore
picom &

while true; do
	xsetroot -name "$(date +"%H:%M %d/%m/%y")" 
	sleep 1m #update every minute
done &



exec dwm
