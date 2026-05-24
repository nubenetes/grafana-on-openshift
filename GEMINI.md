# Grafana on OpenShift Examples - Gemini Instructions

## Project Overview
This repository provides three primary solutions for deploying and managing Grafana observability stacks on OpenShift 4.x.

### Core Solutions:
1. **Solution 1: Grafana Cloud (SaaS)** - Hybrid model using Grafana Alloy.
2. **Solution 2: kube-prometheus-stack** - Self-managed Helm-based deployment.
3. **Solution 3: Grafana Operator (Recommended)** - Native OpenShift integration using Operator lifecycle management.

## Tech Stack & Conventions
- **Platform**: OpenShift 4.10+ (Tested up to 4.14).
- **Automation**: Shell scripts (`.sh`), YAML manifests, Helm charts.
- **Identity**: AzureAD OAuth integration via OpenShift OAuth Proxy.
- **Security**: Custom `SecurityContextConstraints` (SCC) are required for privileged operations (e.g., eBPF in Alloy).

## Workflows
- **Deployment**: Each solution directory contains a README and installation scripts.
- **Dashboards**: Managed as Code via Grafana Operator or Python scripts.
- **Alloy Configuration**: Focus on `metrics.alloy` for telemetry pipelines.

## Critical Constraints
- **Security**: Always verify SCC application (`oc apply -f scc-*.yaml`) before deploying pods that require host access or privileged capabilities.
- **SA Tokens**: Service Account tokens in OCP 4.11+ are bounded. Long-lived tokens (up to 1 year) must be explicitly requested for Thanos datasources.
- **AzureAD**: Redirect URIs must match the OpenShift Route exactly.

## Testing & Validation
- Check Operator health: `oc get subscriptions -n openshift-operators`.
- Verify Alloy debug UI: `oc port-forward <alloy-pod> 12345:12345`.
- Audit OAuth: `oc logs -l app=grafana -c oauth-proxy`.

- **Collapsible Architecture Diagrams**: For complex architectural visualizations (Mermaid diagrams), the documentation MUST use the HTML5 `<details>` and `<summary>` tags. This optimizes page load performance and maintains visual density in high-content technical guides like README.md.
