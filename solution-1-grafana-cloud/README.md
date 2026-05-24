# OpenShift Monitoring with Grafana Cloud

> [!IMPORTANT]
> **Spanish Version / Versión en Español**:
> Este repositorio cuenta con una versión original en español redactada manualmente sin el uso de IA: [README-Spanish.md](README-Spanish.md).
>
> **English Version**:
> This English documentation (`README.md`) is a translation of the original Spanish version.

---

1. [Introduction](#introduction)
2. [Access Policies and Access Token for Connecting to Grafana Cloud](#access-policies-and-access-token-for-connecting-to-grafana-cloud)
3. [Installation Procedure](#installation-procedure)
4. [Helm Chart. Show generic values VS custom values](#helm-chart-show-generic-values-vs-custom-values)
5. [Helm Charts](#helm-charts)
6. [Additional Configuration with `extraConfig`](#additional-configuration-with-extraconfig)
   1. [Different sections](#different-sections)
   2. [How to use](#how-to-use)
      1. [Set as values](#set-as-values)
      2. [Set as files](#set-as-files)
7. [Configure Application Instrumentation](#configure-application-instrumentation)
8. [References](#references)

## Introduction

[Documentation](https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/config-k8s-helmchart/)

The first configuration [values.yaml](values.yaml) is based on the one available in [the configuration section of example.grafana.net](https://example.grafana.net/a/grafana-k8s-app/configuration/cluster-config).

The second configuration [values2.yaml](values2.yaml) is based on the [OpenShift Compatible](https://github.com/grafana/k8s-monitoring-helm/tree/main/examples/openshift-compatible) example.

## Access Policies and Access Token for Connecting to Grafana Cloud

The Helm Chart launched in [grafana-cloud.sh](grafana-cloud.sh) connects to Grafana Cloud with an Access Token created in *Grafana Cloud* -> *Access Policies* https://grafana.com/orgs/example/access-policies

| Vault Key Secret                              | Info                                                                                                       | Vault URL                                                                                 |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| access_token_grafana_cloud_example.grafana.net | Access Token to connect to Grafana Cloud</br>Created in https://grafana.com/orgs/example/access-policies | https://vault.internal.example.com/ui/vault/secrets/it/show/platform/desa/tools/grafana |

## Installation Procedure

1. [ ] [namespace.yaml](namespace.yaml): `oc apply -f namespace.yaml`
2. [ ] [scc-grafanacloud.yaml](scc-grafanacloud.yaml): `oc apply -f scc-grafanacloud.yaml`
3. [ ] [scc-grafanacloud2.yaml](scc-grafanacloud2.yaml): `oc apply -f scc-grafanacloud2.yaml`
4. [X] [grafana-cloud.sh](grafana-cloud.sh) obtained from [our Grafana Cloud account](https://example.grafana.net/a/grafana-k8s-app/configuration/cluster-config): deploys [grafana/k8s-monitoring-helm](https://github.com/grafana/k8s-monitoring-helm/tree/main/charts/k8s-monitoring) chart with [values.yaml](values.yaml). More information in this [*overview*](https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/helm-chart/): `./grafana-cloud.sh`
5. [ ] [grafana-cloud2.sh](grafana-cloud2.sh) Same installation script but with [values2.yaml](values2.yaml).
6. [ ] [grafana-cloud3.sh](grafana-cloud3.sh) Grafana Operator installation with Helm Chart (does not include grafana instances).

## Helm Chart. Show generic values VS custom values

Generic values:

```bash
helm show values grafana/k8s-monitoring > /tmp/output.yaml
```

Custom values:

```bash
helm get values kube-prometheus-stack -n grafana-cloud > /tmp/output-custom.yaml
```

## Helm Charts

| Repository                                         | Name                        | Version |
| -------------------------------------------------- | --------------------------- | ------- |
| https://grafana.github.io/helm-charts              | alloy                       | 0.1.1   |
| https://grafana.github.io/helm-charts              | alloy-events(alloy)         | 0.1.1   |
| https://grafana.github.io/helm-charts              | alloy-logs(alloy)           | 0.1.1   |
| https://grafana.github.io/helm-charts              | alloy-profiles(alloy)       | 0.1.1   |
| https://opencost.github.io/opencost-helm-chart     | opencost                    | 1.34.0  |
| https://prometheus-community.github.io/helm-charts | kube-state-metrics          | 5.18.1  |
| https://prometheus-community.github.io/helm-charts | prometheus-node-exporter    | 4.32.0  |
| https://prometheus-community.github.io/helm-charts | prometheus-operator-crds    | 11.0.0  |
| https://prometheus-community.github.io/helm-charts | prometheus-windows-exporter | 0.3.1   |

## Additional Configuration with `extraConfig`

The Kubernetes Monitoring Helm chart has the ability to supply additional configuration to the Grafana Alloy instances
using the `extraConfig` sections[^1]. Anything put in these sections are added to the existing configuration that is created
by this chart. There are a few methods to use these sections that will be explored in this document.

[^1]: https://github.com/grafana/k8s-monitoring-helm/blob/main/charts/k8s-monitoring/docs/UsingExtraConfig.md

### Different sections

There are two `extraConfig` sections that you can use:

* `.extraConfig` Inserts configuration for the Grafana Alloy instance that scrapes metrics and opens receivers.
* `.logs.extraConfig` Inserts configuration for the Grafana Alloy instance that gathers logs.

### How to use

Helm provides multiple ways to set these additional configuration values. Either keep the values in the same file as the
rest of your Kubernetes Monitoring configuration, or store them separately as their own files and include during Helm
chart install.

#### Set as values

You can set the contents of your extra configuration into your values file:

```shell
$ ls
values.yaml
$ cat values.yaml
cluster:
  name: my-cluster
...
extraConfig: |
  logging {
    level  = "debug"
  }
...
logs:
...
  extraConfig: |
    logging {
      level  = "debug"
    }
...
$ helm upgrade grafana-k8s-monitoring --atomic --timeout 300s grafana/k8s-monitoring --values values.yaml
```

For another example, see [Service Integrations](../../../examples/service-integrations).

#### Set as files

You can save the contents of your extra configuration as files and use Helm's `–set-file` argument:

```shell
$ ls
values.yaml  metricsConfig.alloy  logsConfig.alloy
$ helm upgrade grafana-k8s-monitoring --atomic --timeout 300s grafana/k8s-monitoring \
    --values values.yaml \
    --set-file extraConfig=metricsConfig.alloy \
    --set-file logs.extraConfig=logsConfig.alloy
```

This can be beneficial once your extra configuration grows to a certain size.


## Configure Application Instrumentation

After the Helm chart is deployed, you will need to configure your application instrumentation to send telemetry data to Grafana Alloy using one of these addresses:

- OTLP/gRPC endpoint: http://grafana-k8s-monitoring-grafana-agent.default.svc.cluster.local:4317
- OTLP/HTTP endpoint: http://grafana-k8s-monitoring-grafana-agent.default.svc.cluster.local:4318
- Zipkin endpoint: grafana-k8s-monitoring-grafana-agent.default.svc.cluster.local:9411

## References

- [grafana.com: How to use the Grafana Operator: Managing a Grafana Cloud stack in Kubernetes](https://grafana.com/blog/2024/04/24/how-to-use-the-grafana-operator-managing-a-grafana-cloud-stack-in-kubernetes/)
- [thenewstack.io: Grafana Wants to Help You Avoid Getting Dinged by Kubernetes Costs ](https://thenewstack.io/grafana-wants-to-help-you-avoid-getting-dinged-by-kubernetes-costs/)
- [dev.to/martinheinz: End-to-End Monitoring with Grafana Cloud with Minimal Effort](https://dev.to/martinheinz/end-to-end-monitoring-with-grafana-cloud-with-minimal-effort-13a1)
