#!/bin/sh

previous="prev"
next="next"
play_pause="toggle"
case $1 in
    $previous)
        mpc -q prev && notify-send -u low -t 1800 " $(mpc current)"
        ;;
    $play_pause)
        mpc -q toggle && notify-send -u low -t 1800 " $(mpc current)"
        ;;
    $next)
        mpc -q next && notify-send -u low -t 1800 " $(mpc current)"
        ;;
esac
