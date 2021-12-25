#!/data/data/com.termux/files/usr/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"
df='/data/data/com.termux/files/home/.cache/dpcc/dpcc.temp'

pm10() {
	pm=`cat $df | pup -c ' .outertable_border > tbody:nth-child(1) > tr:nth-child(4) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(8) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(5) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(4) > td:nth-child(4) json{}' | jq -rc '.[0].text' | cut -d '.' -f1`
	echo " $pm µg/m³"
	# echo 'meow'
}

main() {
	pm10
}

main
