#!/bin/sh

kill_discord_shit () {
    discordTasks=$(ps -ax | grep "discord" | head -n -1 | tr -s ' ' '	')
    tasknames=$( echo "$discordTasks" | cut -f5 )
    echo "$tasknames"

    for pid in $( echo "$discordTasks" | cut -f1 )
    do
        kill $pid
    done
    return 0
}

alias dicksword=kill_discord_shit
