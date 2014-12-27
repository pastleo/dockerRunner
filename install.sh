#!/bin/sh

# =================
# Author: PastLeo
# Email: chgu82837@gmail.com
# Date: 2014/12/27
# =================

if [[ $1 ]]; then
    echo "Are you sure you want to remove? [Y/n]";
    read sure
    if [[ $sure != "Y" ]]; then
        echo "Canceled"
        exit
    fi
    rm -f /usr/local/bin/dockerRun
    rm -f /usr/bin/dockerRun
    rm -f /bin/dockerRun
    echo "Remove done!"
    exit
fi

shDir="$( cd "$( dirname "$0" )" && pwd )"

echo $shDir

case "$PATH" in
*/usr/local/bin*)
    installDir="/usr/local/bin"
    ;;
*/usr/bin*)
    installDir="/usr/bin"
    ;;
*/bin*)
    installDir="/bin"
    ;;
esac

if [[ -f $installDir/dockerRun ]]; then
    echo "$installDir/dockerRun exists, removing ..."
    rm -f $installDir/dockerRun
fi

echo "copying the executable into $installDir ..."
cp $shDir/dockerRun $installDir
chmod u+x $installDir/dockerRun

if ! [[ -d $HOME/.dockerRepo ]]; then
    echo "Do you want to link the repo to '.dockerRepo' into your home folder? (Otherwise you need to create on your own) [Y/n]"
    read sure
    if [[ $sure == "Y" ]]; then
        echo "Linking $shDir/dockerRepo to $HOME/.dockerRepo"
        ln -s $shDir/dockerRepo $HOME/.dockerRepo
    fi
fi

echo "Installation Done!"
