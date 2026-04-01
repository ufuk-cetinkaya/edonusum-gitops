#!/bin/bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout tls.key \
-out tls.crt \
-subj "/CN=*.ufukcetinkaya.net/O=dev"

kubectl create secret tls api-tls --cert=tls.crt --key=tls.key -n edonusum

kubectl apply -f k8s/ingress.yaml -n edonusum
