# Installing Grafana Operator on OpenShift

> [!IMPORTANT]
> **Spanish Version / Versión en Español**:
> Este repositorio cuenta con una versión original en español redactada manualmente sin el uso de IA: [README-Spanish.md](README-Spanish.md).
>
> **English Version**:
> This English documentation (`README.md`) is a translation of the original Spanish version.

---

1. [Introduction](#introduction)
2. [AAD Integration with OAuth2.0](#aad-integration-with-oauth20)
3. [Secrets](#secrets)
4. [How to create a long lived service account token in RHOCP 4](#how-to-create-a-long-lived-service-account-token-in-rhocp-4)
5. [References](#references)

## Introduction

This directory contains several files developed during the attempt to configure [Grafana Operator](https://grafana.github.io/grafana-operator/) on OpenShift 4.13.

The Grafana instances deployed by default with this Operator correspond to version **v9.5.17** (May 2024). The manifests have been modified to include a more recent version (**v11.0.0**) or the version tagged as **latest**.

Grafana Operator has been successfully deployed along with a Grafana instance + Grafana Dashboard(s) + Grafana Datasource. OAuth2.0 user integration with admin role/permissions has been achieved.

Files:
- [x] Installation and subscription to Grafana Operator from OpenShift Marketplace [1-grafana-operator.yaml](1-grafana-operator.yaml): `oc apply -f 1-grafana-operator.yaml`
- [x] Creation of OAUTH2.0 client_secret for Grafana registered application in AAD [2-grafana-oauth.sh](2-grafana-oauth.sh): `./2-grafana-oauth.sh`
- [x] Creation of Grafana instance linked to Grafana Operator [3-grafana.yaml](3-grafana.yaml): `oc apply -f 3-grafana.yaml`
- [x] Creation of BEARER_TOKEN [4-grafana-datasource.sh](4-grafana-datasource.sh) for connecting Grafana with [Thanos Querier](https://docs.openshift.com/container-platform/4.13/observability/monitoring/monitoring-overview.html), launching the manifest [templates/5-grafana-datasource.yaml](templates/5-grafana-datasource.yaml) and importing dashboards defined in [templates/6-imported-dashboards.yaml](templates/6-imported-dashboards.yaml): `./4-grafana-datasource.sh`
- [ ] Subscription to Grafana Operator from operatorhubio-catalog [tests/grafana-operator2.yaml](tests/grafana-operator2.yaml)
- [ ] Grafana instance linked to Grafana Operator, with multiple annotations and configuration attempts [tests/grafana2.yaml](tests/grafana2.yaml)

Remember that *Grafana Operator* ceased to be a Red Hat certified operator since OpenShift 4.11, and since then only the community solution not supported or maintained by Red Hat is available.

## AAD Integration with OAuth2.0

Use the same application registered in AAD for [solution-2-kube-prometheus-stack: App Registration in AAD for Grafana](../solution-2-kube-prometheus-stack/README.md#app-registration-in-aad-for-grafana), adding the following "redirect URL": `https://grafana-instance-route-grafana-operator.apps.cluster.example.com/login/azuread`

## Secrets

| Vault Key Secret                           | Info                                               | Vault URL                                                                                 |
| ------------------------------------------ | -------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| aad_client_secret_grafana_openshift_noprod | client_secret in AAD for Grafana OpenShift NoProd | https://vault.internal.example.com/ui/vault/secrets/it/show/platform/desa/tools/grafana |

## How to create a long lived service account token in RHOCP 4

Support case opened by Example: https://access.redhat.com/support/cases/#/case/00000000

Recommended way to deal with kubernetes' new service account tokens to gain access to https://thanos-querier.openshift-monitoring.svc.cluster.local:9091

https://docs.openshift.com/container-platform/4.12/nodes/pods/nodes-pods-secrets.html#nodes-pods-secrets-creating-sa_nodes-pods-secrets

Solution: How to create a long lived service account token in RHOCP 4: https://access.redhat.com/solutions/7025261

It is recommended to obtain bound service account tokens using the TokenRequest API instead of using service account token secrets. The tokens obtained from the TokenRequest API are more secure than the tokens stored in secrets because they have a bounded lifetime and are not readable by other API clients.

The example for service account token creation with a one-year (365 days) expiry is given below:

```bash
$ oc create token <serviceaccountname> --duration=$((365*24))h
```

Note: In RHOCP 4.11 and 4.12, service account token secrets continue to be automatically generated. These tokens are long-lived and function similarly to 
the ones used in RHOCP 4.10 or older versions, allowing them to be utilized in applications. But it is recommended to obtain bound service account tokens 
using the TokenRequest API instead of using service account token secrets, as it will be discontinued in upcoming releases of RHOCP.

## References

- https://grafana.com/blog/2024/04/24/how-to-use-the-grafana-operator-managing-a-grafana-cloud-stack-in-kubernetes/
- https://www.redhat.com/en/blog/thanos-querier-versus-thanos-querier
- https://grafana.github.io/grafana-operator/docs/examples/dashboard_from_grafana_com/readme/
- https://grafana.github.io/grafana-operator/docs/dashboards/#dashboard-customization-by-providing-environment-variables
- https://andidog.de/blog/2022-04-21-grafana-dashboards-best-practices-dashboards-as-code
- [youtube: Grafana 11 Features for Users | Grafana ⭐](https://www.youtube.com/watch?v=ThfFcRETxCs)
- [youtube: Grafana 11 Features for Operators | Grafana ⭐](https://www.youtube.com/watch?v=-C9C7VfFPHg)
