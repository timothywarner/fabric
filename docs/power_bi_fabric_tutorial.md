# Power BI with Fabric: Retail Analytics Tutorial

This tutorial guides you through creating a comprehensive retail analytics solution using Microsoft Fabric and Power BI. We'll cover data ingestion, modeling, DAX calculations, and report creation.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Setting Up Your Fabric Workspace](#setting-up-your-fabric-workspace)
3. [Ingesting Data into Fabric](#ingesting-data-into-fabric)
4. [Creating a Data Model in Power BI](#creating-a-data-model-in-power-bi)
5. [Building DAX Calculations](#building-dax-calculations)
6. [Designing the Report](#designing-the-report)
7. [Publishing to Fabric](#publishing-to-fabric)
8. [Refreshing Data](#refreshing-data)

## Prerequisites

- Microsoft Fabric workspace with access to Lakehouse and Warehouse
- Power BI Desktop (latest version)
- Sample retail data (CSV files provided in this repository)
- Basic understanding of SQL and data modeling concepts

## Setting Up Your Fabric Workspace

1. **Create a New Fabric Workspace**:
   - Go to [Microsoft Fabric](https://fabric.microsoft.com)
   - Click "Create workspace"
   - Name it "Retail Analytics"
   - Set appropriate permissions

2. **Create a Lakehouse**:
   - In your workspace, click "New" → "Lakehouse"
   - Name it "RetailLakehouse"
   - This will store our raw data and transformed tables

3. **Create a Warehouse**:
   - In your workspace, click "New" → "Warehouse"
   - Name it "RetailWarehouse"
   - This will store our analytical model

## Ingesting Data into Fabric

### Option 1: Using Data Pipeline

1. **Create a Data Pipeline**:
   - In your workspace, click "New" → "Data pipeline"
   - Name it "RetailDataIngestion"

2. **Add Copy Activity**:
   - Drag "Copy data" activity onto the canvas
   - Configure source as "File system" and select your local CSV files
   - Configure sink as "Lakehouse" and select your RetailLakehouse
   - Map the columns appropriately
   - Set a schedule for data ingestion (e.g., daily)

3. **Add Data Transformation**:
   - Add a "Data flow" activity after the copy activity
   - Create transformations to clean and prepare the data
   - Save the transformed data to your Lakehouse

### Option 2: Direct Upload (for this tutorial)

1. **Upload Sales Data**:
   - In your Lakehouse, click "Upload files"
   - Select `data/raw/sales_transactions.csv`
   - Click "Upload"

2. **Upload Product Data**:
   - Repeat the process for `data/raw/product_catalog.csv`

3. **Create Tables from Files**:
   - Right-click on each uploaded file
   - Select "Create table from file"
   - Name them "sales_transactions" and "product_catalog"
   - Verify the data types are correct

4. **Run SQL Transformations**:
   - Open the SQL editor in your Lakehouse
   - Copy and paste the contents of `data/transform/load_data.sql`
   - Execute the script to create the analytical views

## Creating a Data Model in Power BI

1. **Connect to Fabric**:
   - Open Power BI Desktop
   - Click "Get data" → "More..."
   - Select "Microsoft Fabric" connector
   - Sign in with your Microsoft account
   - Select your "Retail Analytics" workspace

2. **Import Tables**:
   - Select the following tables:
     - `raw_sales` (from Lakehouse)
     - `raw_products` (from Lakehouse)
     - `daily_sales_summary` (from Warehouse)
     - `product_performance` (from Warehouse)
     - `store_performance` (from Warehouse)
   - Click "Load"

3. **Create Relationships**:
   - Switch to "Model" view
   - Create the following relationships:
     - `raw_sales[product_id]` → `raw_products[product_id]` (Many-to-One)
     - `raw_sales[date]` → `daily_sales_summary[date]` (Many-to-One)
     - `raw_sales[product_id]` → `product_performance[product_id]` (Many-to-One)
     - `raw_sales[store_id]` → `store_performance[store_id]` (Many-to-One)

4. **Set Data Types**:
   - Ensure date columns are set to "Date"
   - Ensure numeric columns are set to "Decimal Number" or "Whole Number" as appropriate
   - Ensure ID columns are set to "Text"

5. **Create Hierarchies**:
   - In the `raw_products` table, create a hierarchy:
     - Name: "Product Hierarchy"
     - Levels: Category → Subcategory → Product Name
   - In the `raw_sales` table, create a hierarchy:
     - Name: "Date Hierarchy"
     - Levels: Year → Month → Day

## Building DAX Calculations

1. **Create Measures for Sales Analysis**:
   - In the `raw_sales` table, create the following measures:

   ```dax
   // Total Sales
   Total Sales = SUMX(raw_sales, raw_sales[quantity] * raw_sales[unit_price])
   
   // Total Quantity Sold
   Total Quantity = SUM(raw_sales[quantity])
   
   // Average Transaction Value
   Avg Transaction Value = DIVIDE([Total Sales], COUNTROWS(raw_sales))
   
   // Total Transactions
   Total Transactions = COUNTROWS(raw_sales)
   
   // Unique Customers
   Unique Customers = DISTINCTCOUNT(raw_sales[customer_id])
   ```

2. **Create Measures for Product Analysis**:
   - In the `raw_products` table, create:

   ```dax
   // Product Sales
   Product Sales = CALCULATE([Total Sales], USERELATIONSHIP(raw_products[product_id], raw_sales[product_id]))
   
   // Product Quantity
   Product Quantity = CALCULATE([Total Quantity], USERELATIONSHIP(raw_products[product_id], raw_sales[product_id]))
   
   // Product Profit
   Product Profit = CALCULATE(
       SUMX(
           raw_sales,
           raw_sales[quantity] * (raw_sales[unit_price] - raw_products[unit_cost])
       ),
       USERELATIONSHIP(raw_products[product_id], raw_sales[product_id])
   )
   
   // Profit Margin
   Profit Margin = DIVIDE([Product Profit], [Product Sales])
   ```

3. **Create Time Intelligence Measures**:
   - In the `raw_sales` table, create:

   ```dax
   // Previous Day Sales
   Previous Day Sales = CALCULATE(
       [Total Sales],
       DATEADD(raw_sales[date], -1, DAY)
   )
   
   // Sales Growth
   Sales Growth = DIVIDE([Total Sales], [Previous Day Sales]) - 1
   
   // Running Total Sales
   Running Total Sales = CALCULATE(
       [Total Sales],
       DATESYTD(raw_sales[date])
   )
   
   // Year-to-Date Sales
   YTD Sales = CALCULATE(
       [Total Sales],
       DATESYTD(raw_sales[date])
   )
   ```

4. **Create Store Performance Measures**:
   - In a new table called "Measures", create:

   ```dax
   // Store Sales
   Store Sales = CALCULATE([Total Sales], USERELATIONSHIP(raw_sales[store_id], store_performance[store_id]))
   
   // Store Transactions
   Store Transactions = CALCULATE([Total Transactions], USERELATIONSHIP(raw_sales[store_id], store_performance[store_id]))
   
   // Store Customers
   Store Customers = CALCULATE([Unique Customers], USERELATIONSHIP(raw_sales[store_id], store_performance[store_id]))
   
   // Sales per Customer
   Sales per Customer = DIVIDE([Store Sales], [Store Customers])
   ```

## Designing the Report

1. **Create Dashboard Layout**:
   - Create a new page called "Executive Summary"
   - Add a title and date slicer at the top
   - Divide the page into sections for KPI cards, charts, and tables

2. **Add KPI Cards**:
   - Add card visuals for:
     - Total Sales
     - Total Transactions
     - Unique Customers
     - Average Transaction Value
   - Format with appropriate colors and icons

3. **Create Sales Trend Chart**:
   - Add a line chart showing daily sales
   - Add a line for the previous period
   - Add data labels and tooltips
   - Add a legend and title

4. **Create Product Performance Chart**:
   - Add a bar chart showing sales by product
   - Sort by sales in descending order
   - Add data labels
   - Add a title and legend

5. **Create Category Analysis**:
   - Add a donut chart showing sales by category
   - Add a bar chart showing sales by subcategory
   - Add appropriate titles and legends

6. **Create Store Performance Table**:
   - Add a table showing store performance metrics
   - Include columns for:
     - Store ID
     - Total Sales
     - Total Transactions
     - Unique Customers
     - Sales per Customer
   - Add conditional formatting for better visualization

7. **Create Customer Analysis**:
   - Add a new page called "Customer Analysis"
   - Create a scatter plot showing customer frequency vs. average transaction value
   - Add a table showing top customers by sales
   - Add a chart showing customer acquisition over time

8. **Create Product Analysis**:
   - Add a new page called "Product Analysis"
   - Create a matrix showing product performance by category and subcategory
   - Add a chart showing profit margin by product
   - Add a table showing inventory levels and reorder points

9. **Create Store Analysis**:
   - Add a new page called "Store Analysis"
   - Create a map showing store locations (if available)
   - Add a chart showing store performance comparison
   - Add a table showing payment method distribution by store

10. **Add Interactivity**:
    - Add slicers for:
      - Date range
      - Product category
      - Store
      - Payment method
    - Ensure all visuals respond to the slicers

## Publishing to Fabric

1. **Save the Report**:
   - Click "File" → "Save as"
   - Name it "Retail Analytics Dashboard"

2. **Publish to Fabric**:
   - Click "Publish" → "Publish to Fabric"
   - Select your "Retail Analytics" workspace
   - Click "Publish"

3. **Set Up Refresh Schedule**:
   - In the Fabric portal, go to your report
   - Click "Schedule refresh"
   - Set up a daily refresh schedule
   - Configure the refresh to use your data pipeline

4. **Share the Report**:
   - Click "Share" to share the report with colleagues
   - Set appropriate permissions
   - Add a description and thumbnail

## Refreshing Data

1. **Manual Refresh**:
   - In the Fabric portal, go to your report
   - Click "Refresh now"

2. **Automatic Refresh**:
   - The report will refresh according to the schedule you set
   - You can monitor refresh history in the Fabric portal

3. **Troubleshooting Refresh Issues**:
   - Check the refresh history for errors
   - Verify data source credentials
   - Check for data pipeline failures

## Next Steps

- Create additional reports for specific business needs
- Set up alerts for key metrics
- Integrate with other Fabric components like Data Science
- Create a mobile-friendly version of the report
- Set up row-level security for sensitive data

## Conclusion

You've now created a comprehensive retail analytics solution using Microsoft Fabric and Power BI. This solution provides insights into sales performance, product popularity, store efficiency, and customer behavior. The modular design allows for easy expansion and customization as your business needs evolve. 