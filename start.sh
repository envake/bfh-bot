#! /bin/bash

# TODO: Add help and parameter handling

# get chromium window and resize
WID=`xdotool search --name --desktop 0 chromium | head -n1`
xdotool windowactivate $WID
echo "[$(date +'%H:%M:%S')] resizing window to 900x700"
xdotool windowsize --sync $WID 900 700
sleep 2

while true; do
	# click departure button
	echo "[$(date +'%H:%M:%S')] clicking departure button"
	xdotool mousemove --sync --window $WID 430 670
	xdotool click 1
	echo "[$(date +'%H:%M:%S')] waiting 15 seconds"
	sleep 15s

	# click to start the fight
	echo "[$(date +'%H:%M:%S')] starting the fight"
	xdotool mousemove --sync --window $WID 217 281
	xdotool click 1
	sleep 2s

	# click fast foward button
	echo "[$(date +'%H:%M:%S')] clicking fast foward button"
	xdotool mousemove --sync --window $WID 387 136
	xdotool click 1
	echo "[$(date +'%H:%M:%S')] waiting 35-43 seconds"
	RANDOM_SECONDS="$(($RANDOM%9+35))"
	sleep $RANDOM_SECONDS

	# click to open chest
	echo "[$(date +'%H:%M:%S')] clicking chest"
	xdotool mousemove --sync --window $WID 424 498
	xdotool click 1
	echo "[$(date +'%H:%M:%S')] waiting 5 seconds"
	sleep 5s

	# click next
	echo "[$(date +'%H:%M:%S')] clicking next"
	xdotool mousemove --sync --window $WID 422 501
	xdotool click 1
	echo "[$(date +'%H:%M:%S')] waiting 20-40 seconds"
	RANDOM_SECONDS="$(($RANDOM%21+20))"
	sleep $RANDOM_SECONDS

	# wait for stamina to recover
	if [[ $1 != "rush" ]]; then
		SECONDS_TO_WAIT="$(($1 * 300))"
		echo "[$(date +'%H:%M:%S')] waiting $SECONDS_TO_WAIT seconds for stamina to recover"
		sleep $SECONDS_TO_WAIT
	fi
	echo "[$(date +'%H:%M:%S')] and again..."

	#xdotool mousemove --sync --window $WID 422 501
	#xdotool click 3
	#sleep 8s
done
