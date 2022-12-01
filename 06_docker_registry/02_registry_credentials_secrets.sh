#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires Docker registry username and password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: registry-basic-auth-secret
  namespace: equino
data:
  users: |2
    $(htpasswd -nb $1 $2 | base64)
EOF

kubectl create secret docker-registry equino-registry -n equino \
--docker-server=registry.cloud.equino.ovh \
--docker-username="$1" \
--docker-password="$2" \
--docker-email=something@randomhere.com
