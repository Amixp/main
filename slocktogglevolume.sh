#!/usr/bin/env bash
xautolock -disable
savebr="$(/home/michael/bin/brightness show)"
#brightness set 0
if [[ $(amixer sget 'Master' toggle | grep "Mono:" \
    | awk '{print $6}') == '[on]' ]]; then
    /home/michael/bin/volume toggle \
	&& i3lock -n --color=333333 \
	&& /home/michael/bin/volume toggle
else
    i3lock -n --color=333333
fi
/home/michael/bin/brightness set $savebr
xautolock -enable
