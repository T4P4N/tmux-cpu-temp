#!/data/data/com.termux/files/usr/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"
# source "$CURRENT_DIR/charge_emoji.sh"
is_charging() {
	if [ $(acpi -a | cut -d" " -f3) == "off-line" ]; then
		$CURRENT_DIR/charge_emoji.sh
	elif [ $(acpi -a | cut -d" " -f3) == "on-line" ]; then
		echo "🔌"
	fi	
}

main() {
	is_charging
}

main
