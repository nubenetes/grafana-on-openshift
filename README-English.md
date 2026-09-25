# Observability with Grafana at Example

> [!IMPORTANT]
> **Human-Coded / Sin IA**:
> All code and manifests in this repository have been developed manually without AI assistance.
>
> **English Version (AI-Generated)**:
> This is a full translation of the original Spanish documentation (`README-Spanish.md`), generated using AI. Multimedia resources were also generated using NotebookLM.
>
> **Spanish Version (Original) / Versión en Español**:
> [README-Spanish.md](README-Spanish.md) (Redactado manualmente sin IA).

---

## 🤖 AI-Generated Multimedia & Video Series (NotebookLM & YouTube)

This repository includes a comprehensive multi-format educational series synthesized with **Gemini NotebookLM** based directly on this repository's code, manifests, and documentation. All videos and shorts are published and freely accessible on YouTube on the [**@nubenetes**](https://youtube.com/@nubenetes) channel.

> [!NOTE]
> **Multilingual Learning Experience**:
> Content features native spoken audio in **English 🇺🇸** and **Spanish 🇪🇸**, and includes automated YouTube subtitles / closed captions (CC) translated into **20+ languages** (French, German, Japanese, Portuguese, Italian, Arabic, Hindi, etc.) for global knowledge sharing.

### 🎬 Full-Length Technical Deep Dives (Videos & Podcasts)

| # | Format | Video / Podcast Title | Category / Domain | Origin Language | Duration | Direct YouTube Link |
|---|:---:|---|---|:---:|:---:|---|
| 1 | 🎙️ **Podcast** | [**Grafana on OpenShift Guide**](https://www.youtube.com/watch?v=am5ohrxpzfY) | Architecture & Fundamentals | 🇺🇸 English *(CC 20+)* | `8:48` | [▶️ Listen to Podcast](https://www.youtube.com/watch?v=am5ohrxpzfY) |
| 2 | 📽️ Video Guide | [**Grafana on OpenShift 2**](https://www.youtube.com/watch?v=EywJm1VdHPk) | Operators, SSO & Dashboards as Code | 🇺🇸 English *(CC 20+)* | `10:04` | [▶️ Watch Video](https://www.youtube.com/watch?v=EywJm1VdHPk) |
| 3 | 🎙️ **Podcast** | [**Grafana en OpenShift**](https://www.youtube.com/watch?v=oD0-JjNWL3k) | Architecture & Solution Comparison | 🇪🇸 Spanish *(CC 20+)* | `8:47` | [▶️ Listen to Podcast](https://www.youtube.com/watch?v=oD0-JjNWL3k) |
| 4 | 📽️ Video Guide | [**Grafana Alloy on OpenShift**](https://www.youtube.com/watch?v=9DnbcMNafjk) | Telemetry Pipelines & OTel Collector | 🇺🇸 English *(CC 20+)* | `6:52` | [▶️ Watch Video](https://www.youtube.com/watch?v=9DnbcMNafjk) |
| 5 | 📽️ Video Guide | [**Grafana on OpenShift**](https://www.youtube.com/watch?v=cNzOptMoHvk) | Enterprise Observability & Federation | 🇺🇸 English *(CC 20+)* | `8:08` | [▶️ Watch Video](https://www.youtube.com/watch?v=cNzOptMoHvk) |
| 6 | 📽️ Video Guide | [**Grafana en OpenShift  SCC**](https://www.youtube.com/watch?v=sDRG1L3jA40) | Security & Hardening (SCC) | 🇪🇸 Spanish *(CC 20+)* | `7:25` | [▶️ Watch Video](https://www.youtube.com/watch?v=sDRG1L3jA40) |
| 7 | 📽️ Video Guide | [**Grafana Alloy en OpenShift**](https://www.youtube.com/watch?v=hTBl9CXzSWQ) | Metrics Pipelines & Grafana Cloud | 🇪🇸 Spanish *(CC 20+)* | `5:44` | [▶️ Watch Video](https://www.youtube.com/watch?v=hTBl9CXzSWQ) |

### ⚡ Topic-Focused Technical Shorts

#### 🏛️ Architecture & Enterprise Strategy
- 🇺🇸 [**Architecting Grafana Observability on OpenShift**](https://www.youtube.com/shorts/ff2Lx2hl6Mg) `(1:07)` — Enterprise observability architecture on OpenShift: SaaS hybrid models vs self-hosted deployments. *(Subtitles in 20+ languages)*

#### 🚀 Deployment Strategies & Operators
- 🇺🇸 [**Three Ways to Deploy Grafana on OpenShift**](https://www.youtube.com/shorts/Vc1eDO4nJog) `(1:26)` — Comparing 3 deployment models: Grafana Cloud + Alloy, kube-prometheus-stack, and Grafana Operator with OAuth proxy. *(Subtitles in 20+ languages)*

#### 🔒 Security & Platform Hardening
- 🇺🇸 [**Why Grafana Alloy Needs OpenShift SCCs**](https://www.youtube.com/shorts/6Py5FpPc674) `(1:24)` — Why default `restricted` SCC blocks Alloy and how to configure custom SecurityContextConstraints safely. *(Subtitles in 20+ languages)*

### 📁 Offline Engineering Artifacts
- 🎙️ **Audio Overview (Spanish):** [Resumen Grafana en OpenShift (MP4)](resources/notebooklm-summaries/Grafana_en_OpenShift.mp4)
- 🎙️ **Audio Overview (English):** [Engineering Guide & Deep-Dive (MP4)](resources/notebooklm-summaries/OpenShift_Grafana_Guide.mp4)
- 📄 **Executive Presentation (PDF):** [Engineering deep-dive (PDF)](resources/notebooklm-summaries/OpenShift_Grafana_Engineering.pdf)
- 📊 **Presentation Slides (PPTX):** [Engineering Slides (PPTX)](resources/notebooklm-summaries/OpenShift_Grafana_Engineering.pptx)

---

1. [Introduction](#introduction)
2. [Grafana Dashboards](#grafana-dashboards)
3. [Releases](#releases)

## Introduction

PoC with different Grafana solutions to monitor our on-prem OpenShift among other possible resources and applications.

There are several Grafana observability solutions:
1. [x] [Solution 1: Grafana Cloud](solution-1-grafana-cloud/README.md):
   - [Grafana Cloud](https://grafana.com)
   - [example.grafana.net](https://example.grafana.net) 
2. [x] [Solution 2: kube-prometheus-stack](solution-2-kube-prometheus-stack/README.md)
3. [x] [Solution 3: Grafana Operator](solution-3-grafana-operator/README.md)

**We are developing and validating "Solution 1", "Solution 2", and "Solution 3".** 

## Grafana Dashboards

- [dotdc/grafana-dashboards-kubernetes](https://github.com/dotdc/grafana-dashboards-kubernetes) A set of modern Grafana dashboards for Kubernetes.

## Releases

- [Grafana 11 release: The latest in visualizations, Scenes-powered dashboards, simple access controls, and more](https://grafana.com/blog/2024/04/09/grafana-11-release-all-the-new-features/)
