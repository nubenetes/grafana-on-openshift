# Observabilidad con Grafana en Example

> [!IMPORTANT]
> **Código Manual / Sin IA**:
> Todo el código y los manifiestos de este repositorio han sido desarrollados manualmente sin ayuda de IA.
>
> **Documentación Original**:
> Este `README-Spanish.md` es el documento original redactado a mano.
>
> **Versiones en Inglés y Recursos IA**:
> El [README.md](README.md) y [README-English.md](README-English.md) han sido generados/traducidos mediante IA. Los recursos multimedia de NotebookLM también son generados por IA.

---

## 🤖 Serie Multimedia y Vídeos Educativos por IA (NotebookLM y YouTube)

Este repositorio cuenta con una serie educativa y técnica multiformato generada con **Gemini NotebookLM** a partir de esta documentación, alojada en el canal de YouTube [**@nubenetes**](https://youtube.com/@nubenetes):

> [!NOTE]
> **Accesibilidad Multilingüe**:
> El contenido cuenta con audio nativo en **Español 🇪🇸** e **Inglés 🇺🇸**, e incluye subtítulos automáticos en YouTube (CC) traducidos a **más de 20 idiomas** (francés, alemán, japonés, portugués, italiano, árabe, hindi, etc.) para facilitar la compartición global de conocimiento.

### 🎬 Sesiones Técnicas en Profundidad (Vídeos y Podcasts)

| # | Formato | Título del Recurso | Categoría | Idioma Origen | Duración | Enlace Directo |
|---|:---:|---|---|:---:|:---:|---|
| 1 | 🎙️ **Podcast** | [**Podcast: Observabilidad en OpenShift con Grafana Alloy**](https://www.youtube.com/watch?v=lHu6K861yDE) | Pipelines OTel y Hardening en OpenShift | 🇪🇸 Español *(CC 20+)* | `15:22` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=lHu6K861yDE) |
| 2 | 🎙️ **Podcast** | [**Podcast: Grafana Alloy Telemetry Pipelines on OpenShift**](https://www.youtube.com/watch?v=VWO14rXilYk) | Telemetry Pipelines & OTel Masterclass | 🇺🇸 Inglés *(CC)* | `36:02` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=VWO14rXilYk) |
| 3 | 🎙️ **Podcast** | [**Grafana en OpenShift**](https://www.youtube.com/watch?v=oD0-JjNWL3k) | Arquitectura y Comparativa de Soluciones | 🇪🇸 Español *(CC 20+)* | `8:47` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=oD0-JjNWL3k) |
| 4 | 🎙️ **Podcast** | [**Grafana on OpenShift Guide**](https://www.youtube.com/watch?v=am5ohrxpzfY) | Arquitectura y Fundamentos | 🇺🇸 Inglés *(CC 20+)* | `8:48` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=am5ohrxpzfY) |
| 5 | 📽️ Guía Vídeo | [**Grafana en OpenShift  SCC**](https://www.youtube.com/watch?v=sDRG1L3jA40) | Seguridad y Hardening (SCC) | 🇪🇸 Español *(CC 20+)* | `7:25` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=sDRG1L3jA40) |
| 6 | 📽️ Guía Vídeo | [**Grafana Alloy en OpenShift**](https://www.youtube.com/watch?v=hTBl9CXzSWQ) | Pipelines de Métricas y Grafana Cloud | 🇪🇸 Español *(CC 20+)* | `5:44` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=hTBl9CXzSWQ) |
| 7 | 📽️ Guía Vídeo | [**Grafana on OpenShift 2**](https://www.youtube.com/watch?v=EywJm1VdHPk) | Operadores, SSO y Dashboards as Code | 🇺🇸 Inglés *(CC 20+)* | `10:04` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=EywJm1VdHPk) |
| 8 | 📽️ Guía Vídeo | [**Grafana on OpenShift**](https://www.youtube.com/watch?v=cNzOptMoHvk) | Observabilidad Empresarial y Federación | 🇺🇸 Inglés *(CC 20+)* | `8:08` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=cNzOptMoHvk) |
| 9 | 📽️ Guía Vídeo | [**Grafana Alloy on OpenShift**](https://www.youtube.com/watch?v=9DnbcMNafjk) | Recolección OTel y Configuración Alloy | 🇺🇸 Inglés *(CC 20+)* | `6:52` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=9DnbcMNafjk) |
| 10 | 🎙️ **Podcast** | [**Secure Grafana on OpenShift**](https://www.youtube.com/watch?v=ihuFDasQaYQ) | Hardening, SCC y SSO Zero-Trust | 🇺🇸 Inglés *(CC 20+)* | `8:48` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=ihuFDasQaYQ) |
| 11 | 📽️ Guía Vídeo | [**Taming Telemetry Costs**](https://www.youtube.com/watch?v=JYxMni8Y99s) | FinOps y Reducción de Cardinalidad | 🇺🇸 Inglés *(CC 20+)* | `6:08` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=JYxMni8Y99s) |
| 12 | 📽️ Guía Vídeo | [**Grafana on OpenShift 3**](https://www.youtube.com/watch?v=5suTmqXoevI) | Ciclo de Vida del Operador y Reconciliación CRD | 🇺🇸 Inglés *(CC 20+)* | `7:27` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=5suTmqXoevI) |
| 13 | 📽️ Guía Vídeo | [**Grafana on OpenShift 4**](https://www.youtube.com/watch?v=x6w9w6x2jC8) | Federación Thanos y Cuadros de Mando en Producción | 🇺🇸 Inglés *(CC 20+)* | `10:20` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=x6w9w6x2jC8) |

### ⚡ Shorts Técnicos (Categorizados por Dominio)

#### 🏛️ Arquitectura y Estrategia
- 🇺🇸 [**Architecting Grafana Observability on OpenShift**](https://www.youtube.com/shorts/ff2Lx2hl6Mg) `(1:07)` — Arquitectura global de observabilidad en OpenShift: SaaS Híbrido frente a despliegues locales. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How Unified Tagging Automates Observability**](https://www.youtube.com/shorts/ddmVCE1OcTA) `(1:30)` — Cómo el etiquetado unificado y puertos nombrados automatizan el descubrimiento en Alloy. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How Unified Tagging Automates OpenShift Telemetry**](https://www.youtube.com/shorts/Ms5olWWE2GA) `(1:16)` — Descubrimiento automatizado de scrapers mediante etiquetas estandarizadas y puertos nombrados en OpenShift. *(Subtítulos en 20+ idiomas)*

#### 🚀 Estrategias de Despliegue y Operadores
- 🇺🇸 [**Three Ways to Deploy Grafana on OpenShift**](https://www.youtube.com/shorts/Vc1eDO4nJog) `(1:26)` — Comparativa de los 3 modelos: Grafana Cloud + Alloy, kube-prometheus-stack y Grafana Operator con OAuth proxy. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How the Grafana Operator Works**](https://www.youtube.com/shorts/Sm6hmy_GEM0) `(1:13)` — Ciclo de reconciliación declarativa de instancias, datasources y dashboards mediante CRDs. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How the Grafana Operator Enforces State**](https://www.youtube.com/shorts/HYSnxo2FZFA) `(1:24)` — Autocorrección GitOps: detección de modificaciones manuales en la interfaz y reversión al estado deseado del CRD. *(Subtítulos en 20+ idiomas)*

#### 🔒 Seguridad, Identidad y Hardening de Plataforma
- 🇺🇸 [**Why Grafana Alloy Needs OpenShift SCCs**](https://www.youtube.com/shorts/6Py5FpPc674) `(1:24)` — Por qué el SCC `restricted` bloquea Alloy y cómo configurar SecurityContextConstraints personalizadas de forma segura. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**Why Grafana Alloy Needs OpenShift SCCs 2**](https://www.youtube.com/shorts/YtqJJVcmz7I) `(1:24)` — Parte 2 sobre SCCs: permisos críticos (allowHostPID y acceso a sockets del host) para monitorización a nivel de nodo. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How OAuth Proxies Secure Grafana**](https://www.youtube.com/shorts/NUq0oC8Ju2M) `(1:18)` — Delegación de SSO en Azure AD (Entra ID) mediante el sidecar OAuth proxy de OpenShift. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**Fixing Thanos Error 403 in OpenShift**](https://www.youtube.com/shorts/zteSp6EVCS8) `(1:24)` — Solución al error HTTP 403 por caducidad de tokens acotados de ServiceAccount (24h) usando TokenRequest de larga duración. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How eBPF Secures Database Traceability**](https://www.youtube.com/shorts/_JWAdO_ggJg) `(1:26)` — Trazabilidad de consultas a base de datos y flujos de red a nivel de kernel mediante eBPF en OpenShift. *(Subtítulos en 20+ idiomas)*

#### 💰 Pipelines de Telemetría y Optimización FinOps
- 🇺🇸 [**How Grafana Alloy Filters Cloud Telemetry**](https://www.youtube.com/shorts/cgMivLf8ixg) `(1:15)` — Filtrado de métricas y reducción de series en metrics.alloy para optimizar costes en Grafana Cloud. *(Subtítulos en 20+ idiomas)*
- 🇺🇸 [**How Unified Tags Correlate Observability Data**](https://www.youtube.com/shorts/9ShT5mel4hI) `(1:20)` — Correlación instantánea entre métricas, logs y trazas distribuidas mediante etiquetas estándar. *(Subtítulos en 20+ idiomas)*

### 📁 Recursos Locales y Documentación Offline
- 🎙️ **Vídeo Resumen (Castellano):** [Resumen Grafana en OpenShift (MP4)](resources/notebooklm-summaries/Grafana_en_OpenShift.mp4)
- 🎙️ **Vídeo Resumen (Inglés):** [Engineering Guide & Deep-Dive (MP4)](resources/notebooklm-summaries/OpenShift_Grafana_Guide.mp4)
- 📄 **Presentación Ejecutiva (PDF):** [Deep-dive Técnico (PDF)](resources/notebooklm-summaries/OpenShift_Grafana_Engineering.pdf)
- 📊 **Diapositivas de Presentación (PPTX):** [Slides de Ingeniería (PPTX)](resources/notebooklm-summaries/OpenShift_Grafana_Engineering.pptx)

---

1. [Introducción](#introducción)
2. [Grafana Dashboards](#grafana-dashboards)
3. [Releases](#releases)

## Introducción

PoC con diferentes soluciones de Grafana para monitorizar nuestros OpenShift on-prem entre otros posibles recursos y aplicaciones.

Existen varias soluciones de observabilidad de Grafana:
1. [x] [Solución 1: Grafana Cloud](solution-1-grafana-cloud/README.md):
   - [Grafana Cloud](https://grafana.com)
   - [example.grafana.net](https://example.grafana.net) 
2. [x] [Solución 2: kube-prometheus-stack](solution-2-kube-prometheus-stack/README.md)
3. [x] [Solución 3: Grafana Operator](solution-3-grafana-operator/README.md)

**Estamos desarrollando y validando la "Solución 1", la "Solución 2" y la "Solución 3".** 

## Grafana Dashboards

- [dotdc/grafana-dashboards-kubernetes](https://github.com/dotdc/grafana-dashboards-kubernetes) A set of modern Grafana dashboards for Kubernetes.

## Releases

- [Grafana 11 release: The latest in visualizations, Scenes-powered dashboards, simple access controls, and more](https://grafana.com/blog/2024/04/09/grafana-11-release-all-the-new-features/)
