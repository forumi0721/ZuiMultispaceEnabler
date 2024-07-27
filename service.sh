#!/system/bin/sh

MODDIR=${0%/*}

check_resetprop(){
    local VALUE="$(resetprop -v "$1")"
    [ ! -z "$VALUE" ] && [ "$VALUE" != "$2" ] && resetprop -v -n "$1" "$2"
}

maybe_resetprop(){
    local VALUE="$(resetprop -v "$1")"
    [ ! -z "$VALUE" ] && echo "$VALUE" | grep -q "$2" && resetprop -v -n "$1" "$3"
}

replace_value_resetprop(){
    local VALUE="$(resetprop -v "$1")"
    [ -z "$VALUE" ] && return
    local VALUE_NEW="$(echo -n "$VALUE" | sed "s|${2}|${3}|g")"
    [ "$VALUE" == "$VALUE_NEW" ] || resetprop -v -n "$1" "$VALUE_NEW"
}

{
	echo "Start at $(date '+%Y-%m-%d %H:%M:%S')"

	until [[ "$(getprop sys.boot_completed)" == "1" ]]; do
		sleep 1
	done

	echo "Boot completed at $(date '+%Y-%m-%d %H:%M:%S')"

	echo "End at $(date '+%Y-%m-%d %H:%M:%S')"
} > /data/local/tmp/ZuiMultispaceEnabler-service.log 2>&1

