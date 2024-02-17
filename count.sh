# The count function was developed to simplify the process of counting files in a directory. It offers a more streamlined alternative to composing lengthy commands for such a basic task, aiming to enhance user convenience and efficiency in the Bash shell environment.
#
# count: A simple and easy-to-use files counter function for Bash shell.
#
# It can be used as an alternative to the traditional grep method of counting files in a current directory.
#
# Usage:
#   count --help       - Short description about options for this function.
#   count .exe         - Counts and Lists all the .exe files in the current directory.
#   count .txt -ls     - Counts and Lists all the .txt files in the current directory.
#   count /            - Counts and Lists all the folders in the current directory.
#   count / -ls        - Counts and lists all the folders, sub-folders, and files inside each folder.
#
# Example:
#   $ count .exe
#   $ count .txt -ls
#
# Author: Rahul Panchal


count(){
	local type=$1
	local option=$2
	local count=0
	echo ""
	if [[ $type == "--help" ]]; then
		cat ~/CountFilesHelp.txt
		return
	else
		for file in *"$type"; do
			((count+=1))
			if [[ $option == "ls" && $file != "*$type" ]]; then
				echo "$count) $file"
			fi

			if [[ $file == "*$type" ]]; then
				if [[ $type == "/" ]]; then
					echo "🐧: 0 folders found in $PWD"
				else
					echo "🐧: 0 $type files found in $PWD"
				fi

				return
			fi
		done	
		echo ""
	fi

	if [[ -z $type ]]; then
		echo "🐧: Total $count files and Folders found here at $PWD"
	else
		if [[ $type == "/" ]]; then
			echo "🐧: $count folders found in $PWD"
		else
			echo "🐧: $count $type files found in $PWD"
		fi
		#echo "Total $count $1 files found in ${LIGHT_YELLOW}$PWD${RESET}"
	fi
		
	if [[ $option == "ls" ]]; then
		echo ""
		echo $(basename $PWD) ":"
		echo ""
		ls *$type
	fi
}


