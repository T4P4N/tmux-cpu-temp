#!/data/data/com.termux/files/usr/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

batt_percentage() {
	acpi -b | grep -m 1 -Eo "[0-9]+%"
}

main() {
	batt_percentage
}
main
