#!/bin/bash

figlet Nekofetch
echo "Cat girl grabber from safebooru"

help ()
{
  echo "s : search"
  echo "f : show"
  echo "c : clear currently saved pictures"
  echo "h : help"
}

## research function

search ()
{
echo "Searching shit"


## link researched (redirect)
LINK=$(curl -Ls 'https://safebooru.donmai.us/posts/random?tags=cat_ears+rating%3Ageneral+' | grep -io -A 10 'https://cdn.donmai.us.*g' | tail -1)

echo "Downloading shit"

curl -s $LINK | kitten icat --use-window-size 10,10,480,300

echo "Save image? [y/N]"
read confirm 
if [[ $confirm == [yYoOsS\n] ]]; 
then
  curl -os catgirl$RANDOM.jpg $LINK
  echo "Saved"
else
  echo "Process exited"
fi
}

show ()
{
  feh catgirl*
}

clear ()
{
  rm -rfv catgirl*
  echo "Cleared saved pictures"
}

case "$1" in 
  h) help;;
  s) search;;
  f) show;;
  c) clear;;
esac

