#!/bin/sh
export GOPATH=/www/website

loc=$(git --git-dir /www/website/.git log -n 1 | head -n1 | cut -d " " -f2)
remote=$(git ls-remote -h https://github.com/ColdhakCA/website | cut -f1)

if [ "$loc" != "$remote" ]; then
    killall coldhak
    cd $GOPATH/coldhak &&
    git pull
    go build
    ./coldhak
fi