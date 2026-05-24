#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# azuread

#############################################################################################################################################
# App Registration in AAD:
# https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/azuread/
# Under Redirect URI, select the app type Web.
# Add the following redirect URLs https://<grafana domain>/login/azuread and https://<grafana domain> then click Register. The app’s Overview page opens.
#############################################################################################################################################

# https://docs.openshift.com/container-platform/4.13/networking/routes/route-configuration.html
# https://docs.openshift.com/container-platform/4.13/networking/routes/route-configuration.html#nw-route-specific-annotations_route-configuration
# https://stackoverflow.com/questions/75907730/how-to-edit-grafana-ini-in-kube-prometheus-stack

################################################################################
# Sample of grafana.ini :
# https://github.com/grafana/grafana/blob/main/conf/sample.ini
################################################################################

# Prompt the user for a Grafana Cloud password
read -p "Enter Grafana azuread.client_secret: " client_secret
echo  # Move to a new line after reading the password

# GRAFANA SECRET: https://github.com/grafana/helm-charts/issues/2896
# https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#override-configuration-with-environment-variables
oc delete secret kube-prometheus-stack-grafana-oauth -n kubeprometheus
oc create secret generic kube-prometheus-stack-grafana-oauth -n kubeprometheus --from-literal GF_AUTH_AZUREAD_CLIENT_SECRET=$client_secret

###############################################################################################################################################################################
# helm upgrade --install is a nice way to install or upgrade depending on if the release exists. 
# 
# https://helm.sh/docs/chart_template_guide/debugging/
# helm install --dry-run --debug will also render your chart locally without installing it, but will also check if conflicting resources are already running on the cluster. 
# Setting --dry-run=server will additionally execute any lookup in your chart towards the server.
#
# helm --create-namespace
###############################################################################################################################################################################

###############################################################################################################################################################################
# $ oc get prometheus -A
# NAMESPACE                            NAME                               VERSION   DESIRED   READY   RECONCILED   AVAILABLE   AGE
# kubeprometheus                       kube-prometheus-stack-prometheus   v2.51.2   1         1       True         True        25m
# openshift-monitoring                 k8s                                2.42.0    2         2       True         True        414d
# openshift-user-workload-monitoring   user-workload                      2.42.0    2         2       True         True        2d22h
###############################################################################################################################################################################

helm upgrade --install --debug -n kubeprometheus kube-prometheus-stack prometheus-community/kube-prometheus-stack -f templates/grafana-dashboards-kubernetes.yaml \
--set grafana.envFromSecret=kube-prometheus-stack-grafana-oauth \
--set grafana.grafana\\.ini.auth\\.azuread.enabled=\"true\" \
--set grafana.grafana\\.ini.auth\\.azuread.allow_sign_up=\"true\" \
--set grafana.grafana\\.ini.auth\\.azuread.auto_login=\"false\" \
--set grafana.grafana\\.ini.auth\\.azuread.allow_assign_grafana_admin=\"true\" \
--set grafana.grafana\\.ini.auth\\.azuread.skip_org_role_sync=\"false\" \
--set grafana.grafana\\.ini.auth\\.azuread.use_pkce=\"true\" \
--set grafana.grafana\\.ini.auth\\.azuread.scopes="openid profile email" \
--set grafana.grafana\\.ini.auth\\.azuread.auth_url="https://login.microsoftonline.com/<AZURE_TENANT_ID>/oauth2/v2.0/authorize" \
--set grafana.grafana\\.ini.auth\\.azuread.token_url="https://login.microsoftonline.com/<AZURE_TENANT_ID>/oauth2/v2.0/token" \
--set grafana.grafana\\.ini.auth\\.azuread.api_url="https://graph.microsoft.com" \
--set grafana.grafana\\.ini.auth\\.azuread.name="Example AAD" \
--set grafana.grafana\\.ini.auth.disable_login_form="True" \
--set grafana.grafana\\.ini.auth\\.azuread.client_id=00000000-0000-0000-0000-000000000000 \
--set grafana.grafana\\.ini.auth\\.azuread.allowed_organizations="<AZURE_TENANT_ID>" \
--set grafana.grafana\\.ini.auth\\.azuread.role_attribute_strict=\"false\" \
--set grafana.grafana\\.ini.server.root_url="https://grafana-kubeprometheus.apps.cluster.example.com/" \
--set grafana.grafana\\.ini.security.disable_initial_admin_creation=\"true\" \
--set grafana.grafana\\.ini.users.default_language="es-ES" \
--set grafana.grafana\\.ini.users.viewers_can_edit=\"false\" \
--set grafana.grafana\\.ini.users.editors_can_admin=\"false\" \
--set nodeSelector="{node-role.kubernetes.io/infra}" \
--set persistence.storageClassName=“ontap-nas” \
--set persistence.enabled=true \
--set grafana.ingress.enabled=\"true\" \
--set kubeStateMetrics.enabled=true \
--set nodeExporter.enabled=false \
--set prometheusOperator.enabled=true \
--set prometheusOperator.denyNamespaces="{openshift-monitoring,openshift-user-workload-monitoring}" \
--set prometheusOperator.tls.enabled=false \
--set prometheusOperator.admissionWebhooks.enabled=false \
--set prometheusOperator.kubeletService.enabled=false \
--set prometheus.enabled=true \
--set alertmanager.enabled=true \
--set grafana.ingress.ingressClassName="openshift-default" \
--set grafana.ingress.hosts={grafana-kubeprometheus.apps.cluster.example.com} \
--set grafana.ingress.annotations."ingress\.kubernetes\.io/ssl-redirect"=\"true\" \
--set grafana.image.tag="11.0.0" \
--set grafana.ingress.tls[0].termination="edge" > /tmp/kubeprometheus.yaml

echo ""
echo ""
echo ""
oc describe cm kube-prometheus-stack-grafana -n kubeprometheus

# https://github.com/prometheus-community/helm-charts/issues/3669
#--set prometheusOperator.kubeletService.enabled=false \
#--set fullnameOverride="prometheus" \

# Lo acepta:
#--set grafana.ingress.annotations."haproxy\.router\.openshift\.io/hsts_header"=\"true\" \

##########################################################################################################################################################
# Two prometheus operators on the same cluster https://github.com/openshift/cluster-monitoring-operator/issues/571
# Yes, it is possible. For that you need to deploy your custom prometheus-operator and use namespaceSelector to exclude namespaces which are watched 
# by prometheus-operator deployed via cluster-monitoring-operator --> Solution: --deny-namespaces
##########################################################################################################################################################

# No parece funcionar:
#--set grafana.ingress.tls[0].hosts={grafana-kubeprometheus.apps.cluster.example.com} \
#--set grafana.ingress.tls[0].secretName=grafana-general-tls \
#--set grafana.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" > /tmp/kubeprometheus.yaml

#https://github.com/prometheus-community/helm-charts/issues/4207
#oc adm policy add-scc-to-user custom-scc -z prometheus-prometheus-node-exporter -n monitoring
#oc adm policy add-scc-to-user custom-scc -z prometheus-kube-state-metrics -n monitoring
#https://github.com/prometheus-community/helm-charts/issues/3370

#https://github.com/openshift/cluster-monitoring-operator/blob/master/assets/node-exporter/security-context-constraints.yaml

