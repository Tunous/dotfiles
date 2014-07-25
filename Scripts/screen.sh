#!/bin/bash

path=~/usr/Dropbox/Images/
name="`date "+%F_%R:%S"`.png"

clientid="5e56eb1c0536c76"

function uploadImage {
    result=$(curl -sH "Authorization: Client-ID $clientid" -F "image=@$1" "https://api.imgur.com/3/upload")

    echo $result | grep -qo '"status":200' && link=$(echo $result | sed -e 's/.*"link":"\([^"]*\).*/\1/' -e 's/\\//g')
    echo "$link"
}

scrot -s $path$name

OUT=$?
if (( OUT == 0 )); then
    if [[ $(dmenu-get "Upload $name to Imgur?" "yes\nno") == yes ]]; then
        url=$(uploadImage $paht$name)
        echo $url | xclip -selection clipboard
        notify "Image saved & Imgur link in clipboard. Url: $url"
    else
        echo $path$name | xclip -selection clipboard
        notify "$name saved: path in clipboard"
    fi
else
    notify "Screenshot failed"
fi
