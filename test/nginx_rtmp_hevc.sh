#!/bin/bash -ve

nginx &

case "$1" in
    *ubuntu*)
        apt-get update && apt-get install -y -q --no-install-recommends curl;;
    *centos*)
        yum install -y -q curl;;
esac

curl -sSf http://127.0.0.1/stat
dd if=/dev/urandom bs=115200 count=300 of=test.yuv # 10 seconds video
#ffmpeg -i rtmp://127.0.0.1/stream/test -vcodec copy -acodec copy -f flv test.flv < /dev/null &
#ffmpeg -re -f rawvideo -vcodec rawvideo -s 320x240 -r 30 -pix_fmt yuv420p -i test.yuv -c:v libsvt_hevc -f flv rtmp://127.0.0.1/stream/test
#sleep 1
#if test -f test.flv; then exit 0; else exit -1; fi
