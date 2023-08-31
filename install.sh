#!/bin/bash

sudo mkdir /opt/open-project

mkdir -p ~/.op

touch ~/.op/oprc

echo '# add your main directories to projectDirs seperated by space' >> ~/.op/oprc
echo '# like projectDirs=$(echo /path-to-your-directories)' >> ~/.op/oprc
echo 'projectDirs=$(echo ~/Documents)' >> ~/.op/oprc

sudo cp ./op.sh /opt/open-project/op.sh

ln -s /opt/open-project/op.sh /bin/op 
