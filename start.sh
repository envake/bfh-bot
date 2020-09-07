#! /bin/bash
QUEST_STAMINA_COST=$1

# get chromium window and resize
WID=`xdotool search --name --desktop 0 chromium | head -n1`
xdotool windowactivate $WID
xdotool windowsize --sync $WID 900 700
sleep 2

while true; do
	# click departure button
	echo "clicking departure button"
	xdotool mousemove --sync --window $WID 430 670
	xdotool click 1
	echo "waiting 15 seconds"
	sleep 15s

	# click to start the fight
	echo "starting the fight"
	xdotool mousemove --sync --window $WID 217 281
	xdotool click 1
	sleep 1s

	# click fast foward button
	echo "clicking fast foward button"
	xdotool mousemove --sync --window $WID 387 136
	xdotool click 1
	echo "waiting 40 seconds"
	sleep 40s

	# click to open chest
	echo "clicking chest"
	xdotool mousemove --sync --window $WID 424 498
	xdotool click 1
	echo "waiting 5 seconds"
	sleep 5s

	# click next
	echo "clicking next"
	xdotool mousemove --sync --window $WID 422 501
	xdotool click 1
	sleep 5s

	# wait for stamina to recover
	RANDOM_SECONDS="$(($RANDOM%40))"
	SECONDS_TO_WAIT="$(($QUEST_STAMINA_COST * 300 + $RANDOM_SECONDS))"
	echo waiting $SECONDS_TO_WAIT seconds for stamina to recover
	sleep $SECONDS_TO_WAIT
	echo "and again..."

	#xdotool mousemove --sync --window $WID 422 501
	#xdotool click 3
	#sleep 8s
done
