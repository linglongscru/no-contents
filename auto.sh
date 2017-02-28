#!/bin/sh
while true
do
	echo "Committing..."
	build_number=$(cat incrementer.txt)
	build_number=$((build_number+1))
	hash=$(openssl rand -base64 32)
	echo $hash >> hashed.txt
	echo $build_number > incrementer.txt
	git add .
	git commit -m "ship to $hash and closed #$build_number"
	total_account=10
	for i in $(seq 1 $total_account); do
		echo "Push for remote no$i"
		git push "no$i" master
		dur=$(awk -v min=60 -v max=180 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
		sleep $dur
	done
	echo "Build number #$build_number"
	duration=$(awk -v min=600 -v max=2700 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
	echo "Next commit in $duration seconds..."
	sleep $duration
done
