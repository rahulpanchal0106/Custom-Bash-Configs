hightime(){
	local ll=$(tail -n 4 ~/time_spent.txt)
	third=$(awk '{ lines[NR] = $0 } END { print lines[NR-2] }' ~/time_spent.txt)
	second=$(awk '{ lines[NR] = $0 } END { print lines[NR-1] }' ~/time_spent.txt)
	echo "Your longest time on bash shell was,"
	echo "on $third ,"
	echo "for $second !"
}
