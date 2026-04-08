#!/bin/bash

cd ../chart

helm install api-gateway . -f values-api-gateway.yaml --namespace api-gateway --create-namespace
helm install auth-api . -f values-auth-api.yaml --namespace auth-api --create-namespace
helm install signer-ws . -f values-signer-ws.yaml --namespace signer-ws --create-namespace
helm install gibuser-worker . -f values-gibuser-worker.yaml --namespace gibuser-worker --create-namespace
helm install gibuser-api . -f values-gibuser-api.yaml --namespace gibuser-api --create-namespace
helm install document-api . -f values-document-api.yaml --namespace document-api --create-namespace
helm install envelope-api . -f values-envelope-api.yaml --namespace envelope-api --create-namespace
helm install envelope-worker . -f values-envelope-worker.yaml --namespace envelope-worker --create-namespace
helm install report-worker . -f values-report-worker.yaml --namespace report-worker --create-namespace
