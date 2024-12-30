# Retail Sales Analysis Using SAS

This project demonstrates an end-to-end data analysis workflow using SAS, focusing on a retail sales dataset.

## Objectives
- Clean and preprocess the dataset to remove inconsistencies and missing values.
- Perform statistical analysis to derive insights.
- Visualize the data to understand sales patterns and customer behavior.

## Workflow

### 1. Data Cleaning & Preparation (`data_cleaning.sas`)
- Imported the raw dataset.
- Removed duplicates, standardized categorical values, and handled missing data.
- Added derived variables like `AgeGroup`.

### 2. Data Analysis (`data_analysis.sas`)
- Performed descriptive statistics on key metrics.
- Analyzed frequency distributions for categorical variables.
- Conducted correlation analysis of numeric variables.

### 3. Data Visualization (`data_visualization.sas`)
- **Total Sales by Product Category:**  
  Identified that Electronics, Clothing, and Beauty categories have similar sales performance, with Electronics leading slightly at $156,905.

- **Proportion of Sales by Age Group:**  
  Observed that older adults contributed the highest to total sales ($187,425), followed by middle-aged ($145,420), and young adults ($123,155).

- **Monthly Sales Trends:**  
  Detected fluctuating monthly sales, with a notable peak in June and a sharp drop in January.

## Tools and Technologies
- **SAS Programming:** Used for data preprocessing, statistical analysis, and visualization.
- **Visualization Techniques:** SAS graphs were utilized to generate bar charts and line plots for clear data interpretation.

## Key Insights
1. **Product Performance:** Electronics and Clothing have the highest sales, suggesting their importance in the inventory mix.
2. **Customer Demographics:** Older adults are the top contributors to sales, highlighting a key customer segment.
3. **Seasonal Trends:** Sales exhibit significant seasonal variation, requiring tailored marketing strategies.
