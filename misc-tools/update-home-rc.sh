#!/bin/sh
#
# Updates home-rc by downloading it from Github, unzipping it and replacing the
# old home-rc with the newly downloaded version.
#
# Note that this script will use the current home-rc's parent directory as
# working directory for downloading and unzipping.

set -o errexit
set -x

cd "$( dirname "$( realpath "$0" )" )"/../..
pwd
rm -rf home-rc-master master.zip
wget https://github.com/YoungCatChen/home-rc/archive/refs/heads/master.zip
unzip master.zip
test -r home-rc-master/install.sh
rm -rf home-rc
mv home-rc-master home-rc
rm master.zip
