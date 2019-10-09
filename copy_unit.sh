#!/bin/bash
#
# Script to add the user name and user path in unit file
# then copy these services to the correct location.

BASEDIR=$(dirname "$0")

for file_path in $(pwd)/${BASEDIR}/unit/*.service
do
    file_name=$(basename ${file_path})
    echo copying ${file_name}
    sed -e 's|{user_home}|'"${HOME}"'|' -e 's|{user}|'"${USER}"'|' ${file_path} > /etc/systemd/system/${file_name}
done

systemctl daemon-reload
