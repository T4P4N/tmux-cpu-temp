#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

temp_interpolation=(
	# funtction name "\#{temp_color_bg}"
	"\#{batt_percentage}"
	"\#{temp_status}"
	"\#{charge_icon}"
	"\#{charge_emoji}"
	"\#{aqi_10}"
	)

temp_commands=(
# script name liek this:
# "#($CURRENT_DIR/scripts/temp_color.sh bg)"
	"#($CURRENT_DIR/scripts/batt_percentage.sh)"
	"#($CURRENT_DIR/scripts/temp_status.sh)"
	"#($CURRENT_DIR/scripts/charge_icon.sh)"
	"#($CURRENT_DIR/scripts/charge_emoji.sh)"
	"#($CURRENT_DIR/scripts/aqi_10.sh)"
	)

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#temp_commands[@]}; i++)); do
		all_interpolated=${all_interpolated//${temp_interpolation[$i]}/${temp_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
