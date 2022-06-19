#!/bin/bash
ls -ltra
echo "Enter folder name:"
read folder

echo "Making archive from $folder ..."
tar -czvf $folder.tar.gz  $folder; # Archive
echo "Encrypting archive $folder.tar.gz ..."
gpg -c $folder.tar.gz; # Encrypt via password
echo "Deleting unencrypted archive $folder.tar.gz ..."
rm $folder.tar.gz # Delete unpassword archive

echo "Done:"
ls -ltra folder.tar.gz.gpg
