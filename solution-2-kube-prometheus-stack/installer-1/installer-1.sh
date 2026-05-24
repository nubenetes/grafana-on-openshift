#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Prompt the user for a Grafana Cloud password
read -p "Enter Grafana azuread.client_secret: " client_secret
echo  # Move to a new line after reading the password

oc delete secret kube-prometheus-stack-grafana-oauth -n kubeprometheus
oc create secret generic kube-prometheus-stack-grafana-oauth -n kubeprometheus --from-literal GF_AUTH_AZUREAD_CLIENT_SECRET=$client_secret

helm upgrade --install --debug -n kubeprometheus kube-prometheus-stack prometheus-community/kube-prometheus-stack -f values-kube-prometheus-stack.yml \
--set grafana.envFromSecret=kube-prometheus-stack-grafana-oauth  > /tmp/kubeprometheus-installer1.yaml
