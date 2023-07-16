if grep -vq 'export HISTTIMEFORMAT="  %F  %T   "' "/home/$(whoami)/.bash_profile"; then
  echo "The file includes the string."
else
  echo "The file does not include the string."
fi

if [[ -e "/home/$(whoami)/Desktop/"$(date +'%F')"- Command history.txt" ]] 

then 

  rm "/home/$(whoami)/Desktop/"$(date +'%F')"- Command history.txt" 

fi

history > "/home/$(whoami)/Desktop/historyfile.txt"

while read p; do
	if [ $(echo "$p" | awk '{print $2}') == $(date +'%F') ]; then
        	echo "$p" >> "/home/$(whoami)/Desktop/"$(date +'%F')"- Command history.txt"
    	fi

done < "/home/$(whoami)/Desktop/historyfile.txt"


rm "/home/$(whoami)/Desktop/historyfile.txt"
