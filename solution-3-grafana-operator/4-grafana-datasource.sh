#!/bin/bash
oc adm policy add-cluster-role-to-user cluster-monitoring-view -z grafana-instance-sa
export GRAFANA_NAMESPACE=grafana-operator
export BEARER_TOKEN=$(oc create token grafana-instance-sa --duration=$((365*24))h -n $GRAFANA_NAMESPACE)
envsubst < templates/5-grafana-datasource.yaml | oc -n $GRAFANA_NAMESPACE apply -f -
#oc delete secret prometheus-token -n grafana-operator
#oc apply -f templates/5-grafana-datasource.yaml
oc apply -f templates/6-imported-dashboards.yaml
oc apply -f templates/7-example-dashboards.yaml

# https://medium.com/@th3b3ginn3r/understanding-service-accounts-in-kubernetes-e9d2abe19df8
# Token Expiration: Kubernetes is designed to expire the token in one hour, but there are many 
# legacy applications running with the non-expiring token.
# https://luandy-4171.medium.com/kubernetes-new-service-account-tokens-25adf0d9c164

##############################################################################################################################################################
# Caso de soporte abierto por Example: https://access.redhat.com/support/cases/#/case/00000000 
# Recommended way to deal with kubernetes' new service account tokens to gain access to https://thanos-querier.openshift-monitoring.svc.cluster.local:9091
#
# https://docs.openshift.com/container-platform/4.12/nodes/pods/nodes-pods-secrets.html#nodes-pods-secrets-creating-sa_nodes-pods-secrets
#
# Solución: How to create a long lived service account token in RHOCP 4: https://access.redhat.com/solutions/7025261
# It is recommended to obtain bound service account tokens using the TokenRequest API instead of using service account token secrets. 
# The tokens obtained from the TokenRequest API are more secure than the tokens stored in secrets because they have a bounded lifetime and are not readable 
# by other API clients.
#
# The example for service account token creation with a one-year (365 days) expiry is given below.
# 
# $ oc create token <serviceaccountname> --duration=$((365*24))h
# 
# Note: In RHOCP 4.11 and 4.12, service account token secrets continue to be automatically generated. These tokens are long-lived and function similarly to 
# the ones used in RHOCP 4.10 or older versions, allowing them to be utilized in applications. But it is recommended to obtain bound service account tokens 
# using the TokenRequest API instead of using service account token secrets, as it will be discontinued in upcoming releases of RHOCP.
##############################################################################################################################################################