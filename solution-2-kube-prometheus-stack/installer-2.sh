#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# generic_oauth

# Prompt the user for a Grafana Cloud password
read -p "Enter Grafana azuread.client_secret: " client_secret
echo  # Move to a new line after reading the password

oc delete secret kube-prometheus-stack-grafana-oauth -n kubeprometheus
oc create secret generic kube-prometheus-stack-grafana-oauth -n kubeprometheus --from-literal GF_AUTH_AZUREAD_CLIENT_SECRET=$client_secret

helm upgrade --install --debug -n kubeprometheus kube-prometheus-stack prometheus-community/kube-prometheus-stack \
--set grafana.envFromSecret=kube-prometheus-stack-grafana-oauth \
--set grafana.grafana\\.ini.auth\\.generic_oauth.scopes="openid profile email" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.auth_url="https://login.microsoftonline.com/<AZURE_TENANT_ID>/oauth2/v2.0/authorize" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.token_url="https://login.microsoftonline.com/<AZURE_TENANT_ID>/oauth2/v2.0/token" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.api_url="https://graph.microsoft.com" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.name="Example AAD" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.client_id=00000000-0000-0000-0000-000000000000 \
--set grafana.ingress.hosts={grafana-kubeprometheus.apps.cluster.example.com} \
--set grafana.ingress.annotations."ingress\.kubernetes\.io/ssl-redirect"=\"true\" \
--set grafana.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set grafana.ingress.tls[0].hosts={grafana-kubeprometheus.apps.cluster.example.com} \
--set nodeSelector="{node-role.kubernetes.io/infra}" \
--set kubeStateMetrics.enabled=false \
--set nodeExporter.enabled=false \
--set persistence.storageClassName=“ontap-nas” \
--set persistence.enabled=true \
--set grafana.ingress.enabled=\"true\" \
--set grafana.ingress.ingressClassName="openshift-default" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.enabled=\"true\" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.allow_sign_up=\"true\" \
--set grafana.grafana\\.ini.auth\\.generic_oauth.auto_login=\"false\" \
--set grafana.grafana\\.ini.server.root_url=grafana-kubeprometheus.apps.cluster.example.com  > /tmp/kubeprometheus-generic-oauth.yaml


