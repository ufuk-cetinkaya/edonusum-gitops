#!/bin/bash

helm repo add argo-helm https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo-helm/argo-cd --namespace argocd --create-namespace
helm install argocd-image-updater argo-helm/argocd-image-updater -n argocd