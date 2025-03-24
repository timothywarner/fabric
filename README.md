# Microsoft Fabric Jumpstart: Enterprise Analytics Training
**Published by Pearson**

## Course Overview
Transform raw data into actionable insights within hours using Microsoft Fabric's comprehensive analytics suite. This course follows Contoso Retail & Supply Co.'s journey as they modernize their analytics platform, breaking down data silos and enabling faster insights through Microsoft Fabric's unified analytics ecosystem.

## What You'll Learn
- Design end-to-end data analytics solutions within the Microsoft Fabric ecosystem
- Implement a medallion lakehouse architecture (Bronze/Silver/Gold) for data quality
- Build real-time event streams for IoT and transactional data
- Perform data science and machine learning on enterprise data
- Create governed, enterprise-grade Power BI reports with Direct Lake

## Who This Course Is For
- Data Engineers and Data Scientists working with enterprise analytics
- IT professionals modernizing their data platform
- Business Intelligence developers and analysts
- Database Administrators transitioning to cloud analytics
- Professionals preparing for Microsoft Fabric certification (DP-600)

## Prerequisites
- Basic Azure familiarity: Understanding of core Azure concepts (resource groups, subscriptions, basic networking)
- Data fundamentals: Knowledge of data types, relational databases, and general data warehousing concepts
- Optional/suggested: Exposure to one programming language (Python, SQL, or similar) for the Databricks section
- Prior cloud data experience (any provider) helps in mapping concepts to the Microsoft Fabric context

## Course Setup Requirements
- Active Azure subscription (free trial available)
- Reliable Internet connection
- Code editor/IDE (Visual Studio Code recommended)
- Azure Storage Explorer (recommended)

## Course Schedule (4 hours)

### Segment 1: Introduction to Microsoft Fabric and Contoso's Analytics Challenge (30 minutes)
- Solving data challenges with Fabric
- Core components overview (OneLake, Lakehouse, Data Engineering, Data Factory, Real-Time Analytics, Data Science, Data Warehouse, Power BI)
- Real-world use cases at Contoso
- Hands-on: Setting up Fabric workspace and OneLake

### Segment 2: Building a Lakehouse – Data Ingestion and Preparation (45 minutes)
- Implementing medallion architecture (Bronze/Silver/Gold)
- Data ingestion with Azure Data Factory
- Data transformation with Spark notebooks
- Hands-on: Building Contoso's lakehouse with sample data
- Q&A

### Segment 3: Real-Time Analytics – Streaming Data for Instant Insights (50 minutes)
- Event streams and KQL databases
- IoT monitoring and fraud detection
- Hands-on: Setting up real-time monitoring for Contoso's delivery fleet
- Break (5 minutes)

### Segment 4: Advanced Analytics and AI – Data Science in Microsoft Fabric (45 minutes)
- Data science workflow in Fabric
- MLflow integration and experiment tracking
- Hands-on: Building a sales forecasting model
- Q&A
- Break (5 minutes)

### Segment 5: Delivering Insights – Power BI, Deployment, and Governance (40 minutes)
- Power BI with Direct Lake
- Deployment pipelines and version control
- Security and governance with Purview
- Hands-on: Creating Contoso's executive dashboard
- Resources and Next Steps (20 minutes)

## Instructor
Tim Warner is a Microsoft MVP (Azure & AI) and Microsoft Certified Trainer with 25+ years of experience. His O'Reilly Live Training classes on generative AI, GitHub, DevOps, data engineering, cloud computing, and Microsoft certification reach hundreds of thousands of students worldwide. Connect with Tim on [LinkedIn](https://www.linkedin.com/in/timothywarner).

## Recommended Preparation
- Watch: Exam DP-900 Microsoft Azure Data Fundamentals by Chris Sorensen
- Watch: Exam AZ-900: Microsoft Azure Fundamentals, 3rd Edition, by Jim Cheshire

## Recommended Follow-up
- Read: Exam Ref DP-900 Microsoft Azure Data Fundamentals by Seara and Milano
- Attend: Exam DP-203: Data Engineering on Microsoft Azure Crash Course by Tim Warner

## Course Resources
- GitHub Repository: https://github.com/timothywarner/fabric
- Microsoft Fabric Documentation: https://learn.microsoft.com/fabric/

## Contoso Scenario Overview
Throughout this course, we follow Contoso Retail & Supply Co.'s journey as they modernize their analytics platform. Contoso faces typical enterprise challenges:
- Siloed data across systems
- Slow ETL processes
- Need for real-time insights
- Growing demand for AI/ML solutions

By adopting Fabric's unified analytics ecosystem, Contoso's data team will:
1. Ingest and refine data in a lakehouse
2. Incorporate streaming IoT and transactional data
3. Perform data science experiments
4. Deliver interactive dashboards

All within a governed, single environment that eliminates duplication and silos through OneLake's "one-copy" approach.
