# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-06-10

### Added
- **Technical Infographics**: Integrated high-resolution engineering blueprints for architecture, deployment, and solution comparison.
- **Visual Documentation**: Added a new collapsible section in the main README for optimized visual density.

## [1.0.0] - 2026-05-24

### Added
- **Unified Grafana on OpenShift Strategy**: Initial stable release covering Cloud, Helm, and Operator-based deployment patterns.
- **Enterprise-Grade Observability**: Full integration guides for Grafana Cloud and self-managed instances on OpenShift 4.x.
- **AI-Driven Onboarding**: Integrated technical blueprints and video summaries for rapid team deployment.
- **Standardized Documentation**: All architectural diagrams now feature collapsible layouts for improved readability.

### Security
- **Infrastructure Anonymization**: Comprehensive sweep to sanitize Azure identifiers, internal domains, and network configurations across all manifests.
- **Compliance Alignment**: Ensured all documentation adheres to data privacy and infrastructure hardening standards.

## [1.0.0-rc.4] - 2026-05-22

### Security
- **Data Anonymization**: Replaced sensitive infrastructure identifiers, including Azure Tenant IDs, internal domain patterns, and private IP addresses, with generic labels.
- **Documentation Hardening**: Updated manifests and guides to ensure no internal organizational references remain in the codebase.

## [1.0.0-rc.3] - 2026-05-22

### Added
- **Initial Engineering Documentation**: Consolidated architecture diagrams and procedures for Grafana on OpenShift (Cloud, Helm, and Operator solutions).
- **Release Synchronization**: Synchronized release version with the Datadog and V2 Portal architectural ecosystem.
- **Mandate Codification**: Added documentation standards for collapsible diagrams in `GEMINI.md`.

### Fixed
- **Documentation Standards**: Verified that all complex Mermaid diagrams utilize collapsible `<details>` blocks for optimal rendering performance.
