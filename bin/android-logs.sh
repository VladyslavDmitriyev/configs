#!/bin/bash

mkdir -p ~/logs

echo "Filter logs? [y/n]"
read ans

if [[ $(echo $ans | tr '[:upper:]' '[:lower:]') == "y" ]]; then
    echo "Enter filter sting: "
    read filter_string
    adb logcat --pid=`adb shell pidof -s $1` | grep -i --line-buffered "$filter_string" | tee ~/logs/filtered.log &
    adb logcat --pid=`adb shell pidof -s $1` > ~/logs/all.log &
else
    adb logcat --pid=`adb shell pidof -s $1` | tee ~/logs/all.log &
fi

adb logcat --pid=`adb shell pidof -s $1` | grep -i --line-buffered "exception" > ~/logs/exceptions.log &
adb logcat --pid=`adb shell pidof -s $1` | grep -i --line-buffered "OkHttp" > ~/logs/http.log 