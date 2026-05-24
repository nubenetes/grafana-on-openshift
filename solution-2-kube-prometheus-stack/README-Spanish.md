# Instalación de kube-prometheus-stack en Openshift 4 de Example

1. [Introducción](#introducción)
2. [Procedimiento de instalación](#procedimiento-de-instalación)
3. [App Registration en AAD para Grafana](#app-registration-en-aad-para-grafana)
4. [Configuración de roles de aplicación para Grafana en AzureAD](#configuración-de-roles-de-aplicación-para-grafana-en-azuread)
5. [Helm Chart CLI](#helm-chart-cli)

## Introducción

Este procedimiento despliega [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) en OpenShift 4 on-prem de Example. Cada nuevo despliegue incluye por defecto la última versión de Grafana (v10.4.1 en mayo 2024), siendo también posible añadir la versión en los parámetros de instalación del helm chart (**v11.0.0** en mayo 2024).

## Procedimiento de instalación

1. [x] [namespace.yaml](namespace.yaml): ```oc apply -f namespace.yaml```
2. [x] [scc-kubeprometheus.yaml](scc-kubeprometheus.yaml): ```oc apply -f scc-kubeprometheus.yaml```
3. [ ] Generic_Oauth + [values-kube-prometheus-stack.yml](installer-1/values-kube-prometheus-stack.yml) file in [installer-1.sh](installer-1/installer-1.sh): ```cd installer-1;./installer-1.sh```
4. [ ] Generic_Oauth in [installer-2.sh](installer-2.sh): ```./installer-2.sh```
5. [X] AzureAD in [installer-3.sh](installer-3.sh): ```./installer-3.sh```

## App Registration en AAD para Grafana

Se ha configurado el Grafana de kube-prometheus-stack con AzureAD de Example via OAuth2.0, para lo cual es necesario [añadir una aplicación registrada en AzureAD para grafana](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/azuread/):

1. Log in to Azure Portal, then click **Azure Active Directory** in the side menu.
2. If you have access to more than one tenant, select your account in the upper right. Set your session to the Azure AD tenant you wish to use.
3. Under **Manage** in the side menu, click **App Registrations** > **New Registration**. Enter a descriptive name.
4. Under **Redirect URI**, select the app type **Web**.
5. Add the following redirect URLs https://grafana-kubeprometheus.apps.cluster.example.com/login/azuread and https://grafana-kubeprometheus.apps.cluster.example.com then click Register. The app’s **Overview** page opens.
6. Note the **Application ID**. This is the OAuth client ID.
7. Click Endpoints from the top menu.
   1. Note the **OAuth 2.0 authorization endpoint (v2)** URL. This is the authorization URL.
   2. Note the **OAuth 2.0 token endpoint (v2)**. This is the token URL.
8. Click **Certificates & secrets**, then add a new entry under **Client secrets** with the following configuration.
   1. Description: Grafana OAuth
   2. Expires: Never
9. Click **Add** then copy the key value. This is the OAuth client secret.
10. Define the required application roles for Grafana [using the Azure Portal](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/azuread/#configure-application-roles-for-grafana-in-the-azure-portal) or [using the manifest file](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/azuread/#configure-application-roles-for-grafana-in-the-manifest-file).
11. Go to **Azure Active Directory** and then to **Enterprise Applications**.
12. Search for your application and click it.
13. Click **Users and Groups**.
14. Click **Add user/group** to add a user or group to the Grafana roles.

## Configuración de roles de aplicación para Grafana en AzureAD

[This section describes setting up basic application roles for Grafana within the Azure Portal](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/azuread/#configure-application-roles-for-grafana-in-the-azure-portal)

1. Go to **App Registrations**, search for your application, and click it.
2. Click **App roles** and then **Create app role**.
3. Define a role corresponding to each Grafana role: Viewer, Editor, and Admin.
   1. Choose a **Display name** for the role. For example, “Grafana Editor”.
   2. Set the **Allowed member types** to **Users/Groups**.
   3. Ensure that the **Value** field matches the Grafana role name. For example, “Editor”.
   4. Choose a **Description** for the role. For example, “Grafana Editor Users”.
   5. Click **Apply**.

## Helm Chart CLI

Show deployed charts:

```bash
helm ls -n kubeprometheus
```

Show status:

```bash
helm status kube-prometheus-stack -n kubeprometheus
```

Generic values:

```bash
helm show values prometheus-community/kube-prometheus-stack > /tmp/output.yaml
```

Custom values:

```bash
helm get values kube-prometheus-stack -n kubeprometheus > /tmp/output-custom.yaml
```

Uninstall:

```bash
helm uninstall kube-prometheus-stack -n kubeprometheus
```
