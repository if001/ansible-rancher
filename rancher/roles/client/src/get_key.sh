#!/bin/bash
SAVE_DIR="/home/guest"
FILE_NAME="token.json"
URI="localhost"
PORT="8080"
URL="http://"${URI}:${PORT}

if [ ! -e ${SAVE_DIR}/${FILE_NAME} ]; then
   json=`curl -X POST ${URL}/v2-beta/apikeys`
   access_key=`echo ${json} | jq -r ."publicValue"`
   secret_key=`echo ${json} | jq -r ."secretValue"`
   echo '{ "access_key":"'${access_key}'","secret_key":"'${secret_key}'" }' > ${SAVE_DIR}/${FILE_NAME}
fi

cat ${SAVE_DIR}/${FILE_NAME}
