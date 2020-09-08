#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_temp_status() {
	# Only tested in Termux with /system/bin/acpi binary
	if command_exists "acpi"; then
		acpi -t | grep -o '.* 1:...' | cut -d " " -f3
	fi
}

main() {
	print_temp_status
}
main
