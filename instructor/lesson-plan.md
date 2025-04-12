# Microsoft Fabric Jumpstart: Detailed Lesson Plan

## Course Overview
This 4-hour course follows Contoso Retail & Supply Co.'s journey as they modernize their analytics platform using Microsoft Fabric. Each segment builds upon the previous, creating a complete end-to-end analytics solution.

## Learning Objectives
By the end of this course, attendees will be able to:
1. Understand Microsoft Fabric's architecture and key components
2. Implement a medallion lakehouse architecture for data quality
3. Build real-time event streams for IoT and transactional data
4. Perform data science and machine learning on enterprise data
5. Create governed, enterprise-grade Power BI reports

## Segment 1: Introduction to Microsoft Fabric and Contoso's Analytics Challenge (30 minutes)

### Learning Objectives
- Understand Microsoft Fabric's value proposition
- Identify key components and their roles
- Set up a Fabric workspace and OneLake

### Content Outline
1. **Introduction (5 minutes)**
   - Welcome and course overview
   - Contoso's analytics challenges
   - Microsoft Fabric's unified approach

2. **Core Components (10 minutes)**
   - OneLake: The unified data lake
   - Lakehouse: Data Engineering foundation
   - Data Factory: Data movement
   - Real-Time Analytics: Event streams
   - Data Science: ML capabilities
   - Data Warehouse: SQL analytics
   - Power BI: Visualization

3. **Hands-on Setup (15 minutes)**
   - Activating Microsoft Fabric trial
   - Creating a workspace
   - Exploring OneLake
   - Quick demo of component integration

## Segment 2: Building a Lakehouse – Data Ingestion and Preparation (45 minutes)

### Learning Objectives
- Implement medallion architecture
- Create data pipelines
- Transform data using Spark

### Content Outline
1. **Medallion Architecture (10 minutes)**
   - Bronze layer: Raw data
   - Silver layer: Cleaned data
   - Gold layer: Business-ready data
   - OneLake's single-copy approach

2. **Data Ingestion (15 minutes)**
   - Azure Data Factory pipelines
   - Copy Data activity
   - Source connectors
   - Destination configuration

3. **Data Transformation (15 minutes)**
   - Spark notebooks
   - Data cleaning
   - Schema evolution
   - Delta tables

4. **Q&A (5 minutes)**

## Segment 3: Real-Time Analytics – Streaming Data for Instant Insights (50 minutes)

### Learning Objectives
- Configure event streams
- Set up KQL databases
- Monitor real-time data

### Content Outline
1. **Event Streams (15 minutes)**
   - Stream configuration
   - Source connections
   - Transformations
   - Destination routing

2. **KQL Databases (15 minutes)**
   - Database setup
   - Query language basics
   - Real-time monitoring
   - Alerts and thresholds

3. **Hands-on IoT Monitoring (15 minutes)**
   - Setting up delivery fleet monitoring
   - Temperature tracking
   - Location tracking
   - Alert configuration

4. **Break (5 minutes)**

## Segment 4: Advanced Analytics and AI – Data Science in Microsoft Fabric (45 minutes)

### Learning Objectives
- Perform data science in Fabric
- Track ML experiments
- Train and evaluate models

### Content Outline
1. **Data Science Workflow (15 minutes)**
   - Notebook environment
   - Data exploration
   - Feature engineering
   - Model training

2. **MLflow Integration (15 minutes)**
   - Experiment tracking
   - Model registry
   - Metrics logging
   - Version control

3. **Hands-on ML Project (10 minutes)**
   - Sales forecasting model
   - Feature preparation
   - Model training
   - Evaluation metrics

4. **Q&A (5 minutes)**

## Segment 5: Delivering Insights – Power BI, Deployment, and Governance (40 minutes)

### Learning Objectives
- Create Power BI reports with Direct Lake
- Implement deployment pipelines
- Apply security and governance

### Content Outline
1. **Power BI Integration (15 minutes)**
   - Direct Lake mode
   - Semantic model creation
   - Report development
   - Dashboard design

2. **Deployment and Version Control (10 minutes)**
   - Deployment pipelines
   - Environment management
   - Git integration
   - CI/CD practices

3. **Security and Governance (10 minutes)**
   - Workspace permissions
   - Row-level security
   - Sensitivity labels
   - Purview integration

4. **Resources and Next Steps (5 minutes)**
   - Certification guidance
   - Further learning
   - Community resources

## Hands-on Labs
Each segment includes practical exercises:
1. Setting up Fabric workspace and OneLake
2. Building Contoso's lakehouse with sample data
3. Setting up real-time monitoring for delivery fleet
4. Building a sales forecasting model
5. Creating Contoso's executive dashboard

## Assessment
- In-class Q&A sessions
- Hands-on lab completion
- Real-world scenario application
- Certification preparation guidance

## Resources
- GitHub repository with lab materials
- Microsoft Fabric documentation
- Contoso scenario datasets
- Additional learning materials 