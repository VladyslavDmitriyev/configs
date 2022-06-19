#!/bin/bash

ls -ltra 
echo "Enter archive name:"
read archive

echo "Decrypting archive $archive ..."
gpg -d $archive | tar -xvzf -

echo "Done:"
ls -ltra 