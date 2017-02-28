#!/bin/sh
while true
do
	echo "\n\n\tNOW DEPLOY"
	total_account=20
	for i in $(seq 1 $total_account); do
		echo "Deploy no$i...."
		build_number=$(cat up.txt)
		build_number=$((build_number+1))
		echo $build_number > up.txt
		echo "Build number #$build_number"
		timeout 60 now 
	done
	sleep 1200
done
