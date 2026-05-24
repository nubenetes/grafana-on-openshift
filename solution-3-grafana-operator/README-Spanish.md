# Instalación de Grafana Operator en OpenShift
1. [Introducción](#introducción)
2. [Integración en AAD con OAuth2.0](#integración-en-aad-con-oauth20)
3. [Secrets](#secrets)
4. [How to create a long lived service account token in RHOCP 4](#how-to-create-a-long-lived-service-account-token-in-rhocp-4)
5. [Referencias](#referencias)

## Introducción

Este directorio contiene varios ficheros desarrollados durante el intento de configurar [Grafana Operator](https://grafana.github.io/grafana-operator/) en Openshift 4.13.

Las instancias de Grafana desplegadas por defecto con este Operator corresponden a la versión **v9.5.17** (mayo 2024). Se han modificado los manifiestos para incluir una versión más reciente (**v11.0.0**) o la versión etiquetada como **latest**.

Se ha conseguido desplegar con éxito Grafana Operator junto a una instancia de Grafana + Grafana Dashboard(s) + Grafana Datasource. Se ha logrado la integración OAuth2.0 del usuario con role/permisos de admin.

Ficheros:
- [x] Instalación y subscripción a Grafana Operator de Openshift Marketplace [1-grafana-operator.yaml](1-grafana-operator.yaml): ```oc apply -f 1-grafana-operator.yaml```
- [x] Creación de OAUTH2.0 client_secret para aplicación registrada de Grafana en AAD [2-grafana-oauth.sh](2-grafana-oauth.sh): ```./2-grafana-oauth.sh```
- [x] Creación de instancia de Grafana vinculada al Grafana Operator [3-grafana.yaml](3-grafana.yaml): ```oc apply -f 3-grafana.yaml```
- [x] Creación de BEARER_TOKEN [4-grafana-datasource.sh](4-grafana-datasource.sh) para la conexión de Grafana con [Thanos Querier](https://docs.openshift.com/container-platform/4.13/observability/monitoring/monitoring-overview.html), lanzando el manifiesto [templates/5-grafana-datasource.yaml](templates/5-grafana-datasource.yaml) y la importación de dashboards definidos en [templates/6-imported-dashboards.yaml](templates/6-imported-dashboards.yaml): ```./4-grafana-datasource.sh```
- [ ] Subscripción a Grafana Operator de operatorhubio-catalog [tests/grafana-operator2.yaml](tests/grafana-operator2.yaml)
- [ ] Instancia de Grafana vinculada al Grafana Operator, con múltiples anotaciones e intentos de configuración [tests/grafana2.yaml](tests/grafana2.yaml)

Recordar que *Grafana Operator* dejó de ser  un operador certificado por Red Hat desde OpenShift 4.11, estando desde entonces sólo disponible la solución de la comunidad no soportada ni mantenida por Red Hat.

## Integración en AAD con OAuth2.0

Utilizar la misma aplicación registrada en AAD para [solution-2-kube-prometheus-stack: App Registration en AAD para Grafana](../solution-2-kube-prometheus-stack/README.md#app-registration-en-aad-para-grafana), añadiendo la siguiente "redirect URL" : ```https://grafana-instance-route-grafana-operator.apps.cluster.example.com/login/azuread```

## Secrets

| Vault Key Secret                           | Info                                               | Vault URL                                                                                 |
| ------------------------------------------ | -------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| aad_client_secret_grafana_openshift_noprod | client_secret en AAD para Grafana OpenShift NoProd | https://vault.internal.example.com/ui/vault/secrets/it/show/platform/desa/tools/grafana |

## How to create a long lived service account token in RHOCP 4

Caso de soporte abierto por Example: https://access.redhat.com/support/cases/#/case/00000000

Recommended way to deal with kubernetes' new service account tokens to gain access to https://thanos-querier.openshift-monitoring.svc.cluster.local:9091

https://docs.openshift.com/container-platform/4.12/nodes/pods/nodes-pods-secrets.html#nodes-pods-secrets-creating-sa_nodes-pods-secrets

Solución: How to create a long lived service account token in RHOCP 4: https://access.redhat.com/solutions/7025261

It is recommended to obtain bound service account tokens using the TokenRequest API instead of using service account token secrets. The tokens obtained from the TokenRequest API are more secure than the tokens stored in secrets because they have a bounded lifetime and are not readable by other API clients.

The example for service account token creation with a one-year (365 days) expiry is given below:

```bash
$ oc create token <serviceaccountname> --duration=$((365*24))h
```

Note: In RHOCP 4.11 and 4.12, service account token secrets continue to be automatically generated. These tokens are long-lived and function similarly to 
the ones used in RHOCP 4.10 or older versions, allowing them to be utilized in applications. But it is recommended to obtain bound service account tokens 
using the TokenRequest API instead of using service account token secrets, as it will be discontinued in upcoming releases of RHOCP.

## Referencias

- https://grafana.com/blog/2024/04/24/how-to-use-the-grafana-operator-managing-a-grafana-cloud-stack-in-kubernetes/
- https://www.redhat.com/en/blog/thanos-querier-versus-thanos-querier
- https://grafana.github.io/grafana-operator/docs/examples/dashboard_from_grafana_com/readme/
- https://grafana.github.io/grafana-operator/docs/dashboards/#dashboard-customization-by-providing-environment-variables
- https://andidog.de/blog/2022-04-21-grafana-dashboards-best-practices-dashboards-as-code
- [youtube: Grafana 11 Features for Users | Grafana ⭐](https://www.youtube.com/watch?v=ThfFcRETxCs)
- [youtube: Grafana 11 Features for Operators | Grafana ⭐](https://www.youtube.com/watch?v=-C9C7VfFPHg)