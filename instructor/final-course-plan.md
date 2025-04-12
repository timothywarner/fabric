# Microsoft Fabric Jumpstart: Final Course Plan

## Course Timing Schedule (4 Hours)

- **11:00 AM** - Segment 1: Introduction to Microsoft Fabric
- **12:00 PM** - 10-minute break
- **12:10 PM** - Segment 2: Building a Lakehouse
- **01:10 PM** - 10-minute break
- **01:20 PM** - Segment 3: Real-Time Analytics
- **02:20 PM** - 10-minute break
- **02:30 PM** - Segment 4: Advanced Analytics & Power BI
- **03:30 PM** - End of session

---

## Segment 1: Introduction to Microsoft Fabric (60 minutes)

### Pre-Session Checklist
- Microsoft Fabric trial activated
- Demo workspace already created
- Sample files ready for upload
- Browser tabs open to Microsoft Learn resources

### Key Learning Objectives
- Understand Fabric's position in the Microsoft data ecosystem
- Identify main components: OneLake, Lakehouse, Real-Time Analytics, etc.
- Set up a Fabric workspace and understand the basics

### Step-by-Step Demo Plan

#### 1. Microsoft Fabric Overview (15 minutes)
- Show the Fabric homepage at [fabric.microsoft.com](https://fabric.microsoft.com)
- **Click Path:** Sign in → Show the Fabric homepage → Navigate to Workspaces
- **Highlight:** Explain how Fabric unifies what were previously separate products
- **Visual Aid:** Show slide with Fabric architecture diagram

#### 2. Workspace Creation & Tour (15 minutes)
- **Click Path:** Home → Create a Workspace → Name it "Contoso Analytics" → Create
- **Explain:** Fabric-enabled workspaces vs. regular Power BI workspaces
- **Click Path:** Inside workspace → Show different experience switcher (Data Engineering, Data Factory, etc.)
- **Highlight:** Point out how all experiences share the same data in OneLake

#### 3. Activating & Managing Fabric Trial (10 minutes)
- **Click Path:** Settings → Admin Portal → Capacity settings → Trial activation
- **Explain:** Trial limitations, capacity concepts
- **Highlight:** Show how to check remaining trial days

#### 4. First Data Upload (15 minutes)
- **Click Path:** Create → Lakehouse → Name it "ContosoLakehouse"
- **File Upload:** 
  - Navigate to Files view
  - Upload `fabric-samples/emp.csv` file
  - Show the automatic schema detection
- **Highlight:** Point out that this data is now available across all Fabric experiences

#### 5. Q&A and Preview of Next Segment (5 minutes)
- Address any immediate questions
- Preview what we'll do with this data in the next segment

### Can't-Miss Examples
- Show the **Sales dataset** example that's built into Fabric
- Demonstrate the **SQL endpoint** by clicking on "SQL analytics endpoint" in the lakehouse
- Show **workspace sharing** by adding a member with different permissions

---

## Segment 2: Building a Lakehouse (60 minutes)

### Pre-Session Checklist
- Lakehouse already created in previous segment
- Pipeline samples ready to import
- Demo data sources prepared

### Key Learning Objectives
- Implement medallion architecture (Bronze/Silver/Gold)
- Create data pipelines for ingestion
- Transform data using notebooks

### Step-by-Step Demo Plan

#### 1. Medallion Architecture Overview (10 minutes)
- **Explain:** Bronze (raw), Silver (clean), Gold (business-ready) concept
- **Click Path:** Lakehouse → Files → Create folders called "Bronze", "Silver", "Gold"
- **Highlight:** Show slide with medallion data flow

#### 2. Data Pipeline Creation (20 minutes)
- **Click Path:** New → Pipeline → Name it "Contoso Sales Ingest"
- **Step-by-Step:**
  1. Add Copy Data activity
  2. Source: HTTP connector
     - Base URL: `https://raw.githubusercontent.com/microsoft/fabric-samples/main/docs-samples/data/sales.csv`
     - Click "Preview data" to show sample
  3. Sink: Lakehouse
     - Connect to ContosoLakehouse
     - Select "Bronze" folder
     - File name: `sales.csv`
  4. Click "Validate" then "Run"
  5. Show successful pipeline execution

#### 3. Data Transformation with Notebook (25 minutes)
- **Click Path:** New → Notebook → Name it "CleanSalesData"
- **Code Blocks to Type:**

  ```python
  # Read the bronze data
  df = spark.read.format("csv").option("header", "true").load("Files/Bronze/sales.csv")
  display(df)
  
  # Basic data cleaning
  from pyspark.sql.functions import col, when, trim
  
  df_clean = df \
      .withColumn("Revenue", col("Revenue").cast("double")) \
      .withColumn("Product", trim(col("Product"))) \
      .withColumn("Region", when(col("Region") == "N/A", None).otherwise(col("Region")))
  
  display(df_clean)
  
  # Save to silver layer as Delta table
  df_clean.write.format("delta").mode("overwrite").save("Files/Silver/sales_silver")
  
  # Create table from the saved files
  spark.sql("CREATE TABLE IF NOT EXISTS sales_silver USING DELTA LOCATION 'Files/Silver/sales_silver'")
  ```

- **Highlight:** Run each cell and explain the transformations

#### 4. Query the Transformed Data (5 minutes)
- **Click Path:** Lakehouse → SQL endpoint
- Run a sample query:
  ```sql
  SELECT 
    Product,
    SUM(Revenue) as TotalRevenue
  FROM
    sales_silver
  GROUP BY
    Product
  ORDER BY
    TotalRevenue DESC
  ```

### Can't-Miss Examples
- Use the **Data Factory Copy assistant** to simplify pipeline creation
- Show **Delta Lake Time Travel** with this query:
  ```sql
  SELECT * FROM sales_silver VERSION AS OF 0
  ```
- Demonstrate **notebook visualization** tools by adding a simple bar chart visualization

---

## Segment 3: Real-Time Analytics (60 minutes)

### Pre-Session Checklist
- KQL Database created in advance
- Sample streaming data source ready
- Demo event stream configured for quick setup

### Key Learning Objectives
- Configure event streams
- Set up KQL databases
- Query real-time data with KQL

### Step-by-Step Demo Plan

#### 1. Real-Time Analytics Overview (10 minutes)
- **Click Path:** Switch to "Real-Time Analytics" experience
- **Explain:** Event streams, KQL databases, real-time dashboards
- **Highlight:** Differences between batch and real-time processing

#### 2. KQL Database Creation (15 minutes)
- **Click Path:** New → KQL Database → Name it "ContosoRealTime"
- **Click Path:** Inside database → Query
- **Simple KQL Query:**
  ```kql
  .create table SensorData (DeviceId: string, Temperature: real, Humidity: real, Timestamp: datetime)
  ```
- **Explain:** How KQL databases store and query time-series data efficiently

#### 3. Event Stream Setup (25 minutes)
- **Click Path:** New → Eventstream → Name it "DeviceTelemetryStream"
- **Step-By-Step:**
  1. Add Source:
     - Select "Sample data source" (for demo purposes)
     - Configure to generate IoT-like data
  2. Add Destination:
     - Select KQL Database
     - Choose "ContosoRealTime"
     - Target table: "SensorData"
  3. Start the event stream
  4. Show events flowing in the monitoring view

#### 4. Real-Time Queries and Analysis (10 minutes)
- **Click Path:** KQL Database → Query
- **Useful KQL Queries:**
  ```kql
  // Last 5 minutes of data
  SensorData
  | where Timestamp > ago(5m)
  | order by Timestamp desc
  
  // Average temperature by device
  SensorData
  | where Timestamp > ago(10m)
  | summarize AvgTemp = avg(Temperature) by DeviceId
  | order by AvgTemp desc
  
  // Detecting anomalies
  SensorData
  | where Temperature > 90 or Temperature < 30
  | project DeviceId, Temperature, Timestamp
  ```

### Can't-Miss Examples
- Show **built-in visualizations** in KQL query results (click the chart icons)
- Demonstrate **auto-refresh** on query results (set to 10-second refresh)
- Show how to create a **basic KQL dashboard**:
  1. Click "Pin to dashboard" on a visualization
  2. Name it "Device Monitoring Dashboard"
  3. Show how it updates in real-time

---

## Segment 4: Advanced Analytics & Power BI (60 minutes)

### Pre-Session Checklist
- Gold layer data prepared
- Sample notebooks ready for ML demo
- Pre-built Power BI template file (.pbit) available

### Key Learning Objectives
- Perform basic data science in Fabric
- Create Power BI reports with Direct Lake
- Implement security and governance

### Step-by-Step Demo Plan

#### 1. Creating the Gold Layer (15 minutes)
- **Click Path:** Lakehouse → New notebook → "GoldLayerPrep"
- **Code to Type:**
  ```python
  # Create an aggregated gold table for reporting
  spark.sql("""
  CREATE OR REPLACE TABLE sales_gold AS
  SELECT 
    Product,
    Region,
    MONTH(Date) as Month,
    YEAR(Date) as Year,
    SUM(Revenue) as TotalRevenue,
    COUNT(*) as TransactionCount
  FROM 
    sales_silver
  GROUP BY 
    Product, Region, MONTH(Date), YEAR(Date)
  """)
  
  # View the results
  display(spark.sql("SELECT * FROM sales_gold"))
  ```
- **Highlight:** Explain how this aggregated view is now ready for reporting

#### 2. Simple Sales Forecast (10 minutes)
- **Click Path:** Continue in the same notebook
- **Code to Type:**
  ```python
  # Simple forecast with linear regression
  from pyspark.ml.feature import VectorAssembler
  from pyspark.ml.regression import LinearRegression
  
  # Prepare data for ML
  sales_df = spark.sql("""
    SELECT 
      Month, 
      Year,
      SUM(TotalRevenue) as MonthlyRevenue
    FROM 
      sales_gold
    GROUP BY 
      Month, Year
    ORDER BY
      Year, Month
  """)
  
  # Create a feature vector
  assembler = VectorAssembler(inputCols=["Month", "Year"], outputCol="features")
  df_vec = assembler.transform(sales_df)
  
  # Train a linear regression model
  lr = LinearRegression(featuresCol="features", labelCol="MonthlyRevenue")
  model = lr.fit(df_vec)
  
  # Make predictions
  predictions = model.transform(df_vec)
  display(predictions.select("Month", "Year", "MonthlyRevenue", "prediction"))
  
  # Save forecast to a table
  predictions.write.format("delta").mode("overwrite").saveAsTable("sales_forecast")
  ```

#### 3. Power BI Direct Lake Setup (15 minutes)
- **Click Path:** New → Semantic Model
- **Step-By-Step:**
  1. Select "Import from a SQL endpoint"
  2. Connect to the Lakehouse SQL endpoint
  3. Select "sales_gold" and "sales_forecast" tables
  4. Click "Transform data" to enter Power Query
  5. Basic transformations:
     - Rename columns to friendly names
     - Create a Date table using "Create calendar table"
     - Add relationships between Date and sales tables
  6. Apply and close

#### 4. Creating the Power BI Report (20 minutes)
- **Click Path:** New → Report (connected to the semantic model)
- **Step-By-Step Report Creation:**
  1. Add a **Card visual**:
     - Drag "TotalRevenue" measure
     - Format to show as currency
  
  2. Add a **Column chart**:
     - X-axis: Month (from Date table)
     - Y-axis: TotalRevenue
     - Legend: Year
  
  3. Add a **Table visual**:
     - Columns: Product, TotalRevenue
     - Sort by: TotalRevenue (descending)
  
  4. Add a **Line chart** for forecast:
     - X-axis: Month + Year (combined)
     - Y-axis: MonthlyRevenue and prediction
  
  5. Add a **Slicer** for Region:
     - Field: Region
     - Style: Dropdown
  
  6. **Format the report**:
     - Add a title "Contoso Sales Dashboard"
     - Set a theme (click Format → Theme)
     - Arrange visuals in a logical layout

### Can't-Miss Examples
- **Direct Lake mode benefits**: Show how changes in the lakehouse immediately reflect in the report
- **Row-level security**: 
  1. In the semantic model, click "Manage roles"
  2. Create a role "RegionalManager"
  3. Add filter: `'sales_gold'[Region] = "USERNAMEEMAIL()"`
  4. Test the role to show filtered data

- **Deployment pipelines**:
  1. Go to Deployment Pipelines
  2. Create new pipeline "Contoso Analytics"
  3. Add workspace to development stage
  4. Show how content can be promoted to Test and Production

## Additional Resources for Learners

### Microsoft Learn Modules
- [Get started with Microsoft Fabric](https://learn.microsoft.com/training/paths/get-started-fabric/)
- [Build a lakehouse in Microsoft Fabric](https://learn.microsoft.com/training/paths/build-lakehouse-fabric/)
- [Implement real-time analytics in Microsoft Fabric](https://learn.microsoft.com/training/paths/implement-real-time-analytics-fabric/)

### Sample Datasets
- [Microsoft Fabric samples GitHub](https://github.com/microsoft/fabric-samples)
- [Adventure Works sample database](https://learn.microsoft.com/sql/samples/adventureworks-install-configure)

### Certification Path
- [DP-600: Implementing Analytics Solutions Using Microsoft Fabric](https://learn.microsoft.com/certifications/exams/dp-600) 