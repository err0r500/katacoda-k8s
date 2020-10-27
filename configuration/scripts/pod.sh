#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: salut
  labels:
    tier: storage
spec:
  containers:
  - name: tester
    image: busybox
    args:
    - sleep
    - "1000000"
    volumeMounts:
    - name: shared-storage
      mountPath: /mnt
  - name: redis-container
    image: redis:latest
    volumeMounts:
    - name: shared-storage
      mountPath: /data/redis
  volumes:
  - name: shared-storage
    emptyDir: {}
EOF