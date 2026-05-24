#!/bin/bash

# Prompt the user for a Grafana Cloud password
read -p "Enter Grafana azuread.client_secret: " client_secret
echo  # Move to a new line after reading the password

# GRAFANA SECRET: https://github.com/grafana/helm-charts/issues/2896
# https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#override-configuration-with-environment-variables
oc delete secret grafana-oauth -n grafana-operator
oc create secret generic grafana-oauth -n grafana-operator --from-literal GF_AUTH_AZUREAD_CLIENT_SECRET=$client_secret

