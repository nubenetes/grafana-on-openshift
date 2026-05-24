#!/bin/bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Prompt the user for a Grafana Cloud password
read -p "Enter Grafana Cloud password: " password
echo  # Move to a new line after reading the password

helm upgrade --install grafana-k8s-monitoring grafana/k8s-monitoring --namespace grafana-cloud --create-namespace --debug --values values2.yaml \
    --set externalServices.prometheus.basicAuth.password=$password \
    --set externalServices.loki.basicAuth.password=$password > /tmp/output.yaml
    #--set-file extraConfig=metrics.alloy 
    # --set-file logs.extraConfig=logs.alloy 
    #--set-file logs.extraConfig=events.alloy

# Helm chart version 1.0.3 has been released: https://github.com/grafana/k8s-monitoring-helm/releases/tag/v1.0.3
# Along with an updated version of the OpenShift example: https://github.com/grafana/k8s-monitoring-helm/tree/main/examples/openshift-compatible