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

## 📽️ Resúmenes Multimedia de NotebookLM (IA)

Para una revisión rápida y dinámica del contenido de este repositorio, puedes consultar estos materiales generados automáticamente por NotebookLM:

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
