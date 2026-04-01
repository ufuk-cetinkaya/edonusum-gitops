#!/bin/bash

cd ../chart
helm install signer-ws . -f values-signer-ws.yaml --namespace edonusum --create-namespace
helm install gibuser-worker . -f values-gibuser-worker.yaml --namespace edonusum
helm install gibuser-api . -f values-gibuser-api.yaml --namespace edonusum
helm install document-api . -f values-document-api.yaml --namespace edonusum
helm install envelope-api . -f values-envelope-api.yaml --namespace edonusum
helm install envelope-worker . -f values-envelope-worker.yaml --namespace edonusum
helm install report-worker . -f values-report-worker.yaml --namespace edonusum
