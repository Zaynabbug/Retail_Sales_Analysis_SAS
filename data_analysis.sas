/* Import the Cleaned Data */
PROC IMPORT DATAFILE='/home/u64114351/retail_sales_data/cleaned_sales_data.csv'
   OUT=clean_data
   DBMS=CSV
   REPLACE;
GETNAMES=YES;
RUN;

/* 1. Descriptive Statistics */
PROC MEANS DATA=clean_data N MEAN STD MIN MAX;
    VAR Age Quantity "Price per Unit"n "Total Amount"n;
RUN;

/* 2. Frequency Distribution */
PROC FREQ DATA=clean_data;
    TABLES Gender "Product Category"n AgeGroup / NOCUM;
RUN;

/* 3. Total Sales by Product Category */
PROC MEANS DATA=clean_data SUM;
    CLASS "Product Category"n;
    VAR "Total Amount"n;
    TITLE "Total Sales by Product Category";
RUN;

/* 4. Correlation Analysis */
PROC CORR DATA=clean_data;
    VAR Age Quantity "Total Amount"n;
    TITLE "Correlation Analysis of Numeric Variables";
RUN;
