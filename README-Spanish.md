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
| 1 | 🎙️ **Podcast** | [**Grafana en OpenShift**](https://www.youtube.com/watch?v=oD0-JjNWL3k) | Arquitectura y Comparativa de Soluciones | 🇪🇸 Español *(CC 20+)* | `8:47` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=oD0-JjNWL3k) |
| 2 | 📽️ Guía Vídeo | [**Grafana en OpenShift  SCC**](https://www.youtube.com/watch?v=sDRG1L3jA40) | Seguridad y Hardening (SCC) | 🇪🇸 Español *(CC 20+)* | `7:25` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=sDRG1L3jA40) |
| 3 | 📽️ Guía Vídeo | [**Grafana Alloy en OpenShift**](https://www.youtube.com/watch?v=hTBl9CXzSWQ) | Pipelines de Métricas y Grafana Cloud | 🇪🇸 Español *(CC 20+)* | `5:44` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=hTBl9CXzSWQ) |
| 4 | 🎙️ **Podcast** | [**Grafana on OpenShift Guide**](https://www.youtube.com/watch?v=am5ohrxpzfY) | Arquitectura y Fundamentos | 🇺🇸 Inglés *(CC 20+)* | `8:48` | [▶️ Escuchar Podcast](https://www.youtube.com/watch?v=am5ohrxpzfY) |
| 5 | 📽️ Guía Vídeo | [**Grafana on OpenShift 2**](https://www.youtube.com/watch?v=EywJm1VdHPk) | Operadores, SSO y Dashboards as Code | 🇺🇸 Inglés *(CC 20+)* | `10:04` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=EywJm1VdHPk) |
| 6 | 📽️ Guía Vídeo | [**Grafana Alloy on OpenShift**](https://www.youtube.com/watch?v=9DnbcMNafjk) | Recolección OTel y Configuración Alloy | 🇺🇸 Inglés *(CC 20+)* | `6:52` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=9DnbcMNafjk) |
| 7 | 📽️ Guía Vídeo | [**Grafana on OpenShift**](https://www.youtube.com/watch?v=cNzOptMoHvk) | Observabilidad Empresarial y Federación | 🇺🇸 Inglés *(CC 20+)* | `8:08` | [▶️ Ver Vídeo](https://www.youtube.com/watch?v=cNzOptMoHvk) |

### ⚡ Shorts Técnicos (Categorizados por Dominio)

#### 🏛️ Arquitectura y Estrategia
- 🇺🇸 [**Architecting Grafana Observability on OpenShift**](https://www.youtube.com/shorts/ff2Lx2hl6Mg) `(1:07)` — Arquitectura global de observabilidad en OpenShift: SaaS Híbrido frente a despliegues locales. *(Subtítulos en 20+ idiomas)*

#### 🚀 Estrategias de Despliegue y Operadores
- 🇺🇸 [**Three Ways to Deploy Grafana on OpenShift**](https://www.youtube.com/shorts/Vc1eDO4nJog) `(1:26)` — Comparativa de los 3 modelos: Grafana Cloud + Alloy, kube-prometheus-stack y Grafana Operator con OAuth proxy. *(Subtítulos en 20+ idiomas)*

#### 🔒 Seguridad y Hardening de Plataforma
- 🇺🇸 [**Why Grafana Alloy Needs OpenShift SCCs**](https://www.youtube.com/shorts/6Py5FpPc674) `(1:24)` — Por qué el SCC `restricted` bloquea Alloy y cómo configurar SecurityContextConstraints personalizadas de forma segura. *(Subtítulos en 20+ idiomas)*

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
