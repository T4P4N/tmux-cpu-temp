## Tmux cpu temp 
cpu temprature in tmux status bar

### Installation
add this line in your `.tmux.conf` file
```
set -g @plugin 't4p4n/tmux-cpu-temp'
```
 and press `PREFIX` + `I` to fetch the plugin

### Usage
add this line in your `.tmux` file
```
set -g status-right '#{temp_status}°C
```
and restart/reload tmux to see the temp in status right.

## Screenshot
![Screenshot](https://user-images.githubusercontent.com/32695903/117459732-5b1d3600-af69-11eb-87c0-641765e9d53b.png)

