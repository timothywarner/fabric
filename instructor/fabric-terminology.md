# Microsoft Fabric Terminology Cheat Sheet

## Core Concepts

| Term | Definition | When to Mention |
|------|------------|----------------|
| **Microsoft Fabric** | Unified SaaS analytics platform that combines data integration, storage, and analytics | Opening of course |
| **OneLake** | Centralized data lake that provides a single copy of data across all Fabric experiences | Segment 1 when explaining architecture |
| **Workspace** | Container for all Fabric items (lakehouses, reports, pipelines, etc.) | During workspace creation in Segment 1 |
| **Capacity** | Dedicated compute resources for Fabric; can be trial, Premium, or Fabric | When discussing trial activation |

## Experiences & Components

| Experience | Key Components | Description | When to Demo |
|------------|----------------|-------------|-------------|
| **Data Engineering** | Lakehouse, Notebooks, Spark | Tools for data preparation with Spark | Segment 2 |
| **Data Factory** | Pipelines, Dataflows | Data movement and transformation services | Segment 2 |
| **Real-Time Analytics** | KQL Database, Eventstream | Tools for processing and analyzing streaming data | Segment 3 |
| **Data Science** | Notebooks, ML Models, Experiments | Machine learning model development and tracking | Segment 4 |
| **Power BI** | Reports, Dashboards, Semantic Models | Business intelligence and visualization | Segment 4 |

## Lakehouse Concepts

| Term | Definition | Demo in Segment |
|------|------------|----------------|
| **Medallion Architecture** | Data organization pattern with Bronze (raw), Silver (cleaned), and Gold (business-ready) layers | Segment 2 |
| **Delta Lake** | Open-source storage format offering ACID transactions, versioning, and schema evolution | Segment 2 |
| **SQL Analytics Endpoint** | SQL interface for querying lakehouse data | Segment 2 |
| **Direct Lake** | Power BI connection mode for lakehouse data that combines import and direct query benefits | Segment 4 |
| **Shortcuts** | References to external data sources without copying the data | Segment 2 (optional) |

## Real-Time Analytics Terms

| Term | Definition | Demo in Segment |
|------|------------|----------------|
| **Eventstream** | No-code data pipeline for streaming data | Segment 3 |
| **KQL** | Kusto Query Language used for querying time-series data | Segment 3 |
| **KQL Database** | Database optimized for time-series analytics | Segment 3 |
| **KQL Queryset** | Collection of KQL queries that can be saved and shared | Segment 3 |

## Data Science Terms

| Term | Definition | Demo in Segment |
|------|------------|----------------|
| **MLflow** | Open-source platform for managing ML lifecycle | Segment 4 |
| **Experiment** | Collection of ML model training runs | Segment 4 |
| **Notebook** | Interactive coding environment supporting Python, SQL, R, etc. | Segments 2 & 4 |
| **Model Registry** | Repository for managing ML model versions | Segment 4 (optional) |

## Power BI Terms

| Term | Definition | Demo in Segment |
|------|------------|----------------|
| **Semantic Model** | Formerly called dataset; defines data model for reports | Segment 4 |
| **Report** | Collection of visualizations created from a semantic model | Segment 4 |
| **Deployment Pipeline** | Tool for promoting content through development stages | Segment 4 |
| **Row-Level Security (RLS)** | Mechanism to restrict data access based on user attributes | Segment 4 |

## Governance Concepts

| Term | Definition | When to Mention |
|------|------------|----------------|
| **Sensitivity Labels** | Classification tags that control data access and usage | Segment 4 during security demo |
| **Purview Integration** | Connection to Microsoft Purview for data cataloging and lineage | Segment 4 (optional mention) |
| **Audit Logs** | Records of user actions and system events | Briefly in Segment 4 |
| **Item Permissions** | Access controls for workspaces and individual items | During workspace sharing demo |

## Key File Formats

| Format | Description | Used In |
|--------|-------------|---------|
| **Delta** | Open-source storage format with versioning | Lakehouse tables |
| **Parquet** | Columnar storage format | Often used in Bronze layer |
| **CSV** | Comma-separated values | Often used for data import |
| **JSON** | JavaScript Object Notation | Often used for API data |

## Common URLs & Endpoints

| Resource | URL | When Needed |
|----------|-----|-------------|
| Fabric Home | [fabric.microsoft.com](https://fabric.microsoft.com) | Starting the course |
| Fabric Documentation | [learn.microsoft.com/fabric](https://learn.microsoft.com/fabric) | When referencing docs |
| Fabric Community | [community.fabric.microsoft.com](https://community.fabric.microsoft.com) | For student resources |
| Fabric Samples GitHub | [github.com/microsoft/fabric-samples](https://github.com/microsoft/fabric-samples) | For code examples |

## Keyboard Shortcuts

| Action | Shortcut | When Useful |
|--------|----------|-------------|
| Run cell in notebook | F5 or Shift+Enter | During notebook demos |
| Open Power BI report in edit mode | Alt+Shift+F | When editing reports |
| Refresh data in Power BI | F5 | When showing Direct Lake updates |
| Format SQL/KQL query | Shift+Alt+F | When typing queries | 