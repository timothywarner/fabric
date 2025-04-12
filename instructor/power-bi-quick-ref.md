# Power BI in Microsoft Fabric: Instructor Quick Reference

## Connection Types in Fabric

| Connection Type | Description | When to Use |
|----------------|-------------|-------------|
| **Direct Lake** | Connects directly to Delta tables in OneLake without importing data | For large datasets where you need real-time updates |
| **Import** | Imports the data into Power BI's memory | For smaller datasets where query performance is critical |
| **DirectQuery** | Queries the source directly | When data is too large to import or requires real-time updates |

## Step-by-Step: Creating a Semantic Model from Lakehouse

### Option 1: From Lakehouse SQL Endpoint (Recommended for Demo)

1. Go to your Lakehouse
2. Click "SQL analytics endpoint" in the top menu
3. You'll see your tables listed in the explorer
4. Click "New Power BI dataset" button in the top menu
5. In the dialog, select the tables you want to include
6. Click "Create"

### Option 2: From Power BI Experience

1. Switch to the "Power BI" experience using the experience switcher
2. Click "+ New" → "Semantic model"
3. Select "SQL Server" as the source
4. Enter connection details:
   - Server: `[your-workspace-name].sql.fabric.microsoft.com`
   - Database: The name of your Lakehouse
   - Authentication: Microsoft Account
5. Click "Next" and select your tables
6. Click "Transform Data" to open Power Query

## Common Power Query Transformations

These are the most commonly used transformations during demos:

```
# Rename column
Table.RenameColumns(Source, {{"old_name", "New Name"}})

# Create date table
= List.Dates(
    #date(2022, 1, 1),
    365,
    #duration(1, 0, 0, 0)
)
```

## Building Your First Report (Exact Click Path)

1. From the Power BI experience, click "New report"
2. Select your semantic model
3. In the "Fields" pane (right side):
   - Expand your sales table
   - Find measures like "Revenue" or dimensions like "Product"

4. Add a Card visual:
   - Click the "Card" icon in the Visualizations pane
   - Drag "TotalRevenue" to the "Fields" area of the visual

5. Add a Column Chart:
   - Click the "Column chart" icon in Visualizations
   - Drag a date field (e.g., "Month") to the "X-axis"
   - Drag "Revenue" to the "Y-axis"
   - Drag "Year" to the "Legend" area

6. Add a Table:
   - Click the "Table" icon in Visualizations
   - Drag "Product" to the "Columns" area
   - Drag "Revenue" to the "Values" area
   - Click on the "..." menu for the visual, select "Sort by" → "Revenue" → "Largest to smallest"

7. Add a Slicer:
   - Click the "Slicer" icon in Visualizations
   - Drag "Region" to the "Field" area
   - In the visual's properties, change slicer type to "Dropdown"

## Creating a Date Table (Copy/Paste Ready)

In Power Query Editor:

1. Click "New Source" → "Blank Query"
2. In the formula bar, paste this code:

```
let
    Source = List.Dates(#date(2022, 1, 1), 365, #duration(1, 0, 0, 0)),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Date"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "Year", each Date.Year([Date])),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "Month Number", each Date.Month([Date])),
    #"Added Custom2" = Table.AddColumn(#"Added Custom1", "Month Name", each Date.MonthName([Date])),
    #"Added Custom3" = Table.AddColumn(#"Added Custom2", "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date]))),
    #"Changed Type" = Table.TransformColumnTypes(#"Added Custom3",{{"Date", type date}, {"Year", Int64.Type}, {"Month Number", Int64.Type}, {"Month Name", type text}, {"Quarter", type text}})
in
    #"Changed Type"
```

3. Rename the query to "Date"
4. Click "Close & Apply"

## Adding Relationships (Click Path)

1. In Power BI Desktop or Service, click "Model" view (icon on left)
2. Drag from the date field in your fact table to the Date field in your Date table
3. In the popup dialog, ensure:
   - Cardinality: Many to one (*:1)
   - Cross filter direction: Single
   - Make this relationship active: Yes
4. Click "OK"

## Creating Basic Measures (Copy/Paste Ready)

In Power BI report view:

1. Right-click on your fact table
2. Select "New measure"
3. Enter these formulas as needed:

```
Total Revenue = SUM(sales_gold[TotalRevenue])

Revenue YTD = 
TOTALYTD(SUM(sales_gold[TotalRevenue]), 'Date'[Date])

Revenue Growth % = 
VAR CurrentPeriod = [Total Revenue]
VAR PreviousPeriod = CALCULATE([Total Revenue], DATEADD('Date'[Date], -1, YEAR))
RETURN
IF(PreviousPeriod = 0, BLANK(), (CurrentPeriod - PreviousPeriod) / PreviousPeriod)
```

## Setting Up Row-Level Security (RLS)

1. Go to the "Model" view
2. Click "Manage roles" in the ribbon
3. Click "Create" and name the role (e.g., "RegionalManagers")
4. Select your fact table in the dropdown
5. Enter a DAX filter expression, e.g.:
   ```
   [Region] = USERNAME() or [Region] = "Global"
   ```
6. Click "Save"
7. Test the role by clicking "View As" in the ribbon

## Troubleshooting Common Issues

### Semantic Model Creation Fails

**Symptoms**: Error when creating a semantic model from lakehouse
**Fix**: 
- Ensure the SQL endpoint is running (it shows "Running" status in the lakehouse)
- Check that tables are properly created (not just files)
- Try using a different browser or clearing cache

### Can't See Delta Tables

**Symptoms**: Tables don't appear in the SQL endpoint view
**Fix**:
- Make sure you ran the `CREATE TABLE` command in your notebook
- Tables need to be registered, not just saved as files
- Use this code in a notebook:
  ```
  spark.sql("CREATE TABLE IF NOT EXISTS table_name USING DELTA LOCATION 'Files/path/to/data'")
  ```

### Report Not Showing Updated Data

**Symptoms**: Updates to the data not appearing in Power BI reports
**Fix**:
- For Direct Lake: 
  - Wait a few minutes for synchronization
  - Click "Refresh" in the report
- For Import mode:
  - Click "Refresh" in the dataset settings
  - Check the refresh history for errors

### Unable to Create Relationships

**Symptoms**: Error when trying to create relationships between tables
**Fix**:
- Ensure the columns have the same data type
- Make sure the columns have unique values on the "one" side
- Check if there are nulls or blank values causing issues

## Demo Shortcuts (When Running Behind)

If running short on time:

1. **Pre-create the semantic model** before the demo
2. Use a **pre-built report template** (.pbit) that only needs data connection
3. Have a backup **completed report file** (.pbix) ready to show
4. Focus only on **adding visuals to an existing report** rather than building from scratch

## Ready-to-Use SQL Queries for Demo

```sql
-- For sales overview
SELECT 
  Product,
  SUM(TotalRevenue) as Revenue,
  COUNT(DISTINCT Region) as RegionCount
FROM 
  sales_gold
GROUP BY 
  Product
ORDER BY 
  Revenue DESC;

-- For time-based analysis
SELECT
  Month,
  Year,
  SUM(TotalRevenue) as MonthlyRevenue
FROM
  sales_gold
GROUP BY
  Month, Year
ORDER BY
  Year, Month;
``` 