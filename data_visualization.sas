/* Import the Cleaned Data */
PROC IMPORT DATAFILE='/home/u64114351/retail_sales_data/cleaned_sales_data.csv'
   OUT=clean_data
   DBMS=CSV
   REPLACE;
GETNAMES=YES;
RUN;

/* 1. Bar Chart: Total Sales by Product Category */
PROC SGPLOT DATA=clean_data;
    VBAR "Product Category"n / RESPONSE="Total Amount"n STAT=SUM 
         DATALABEL FILLATTRS=(COLOR=CX4A90E2); /* Modern muted blue */
    TITLE "Total Sales by Product Category";
    XAXIS LABEL="Product Category";
    YAXIS LABEL="Total Sales ($)";
RUN;

/* 2. Horizontal Stacked Bar Chart: Proportion of Sales by Age Group */
PROC SGPLOT DATA=clean_data;
    HBAR AgeGroup / RESPONSE="Total Amount"n STAT=SUM 
         DATALABEL FILLATTRS=(COLOR=CX50E3C2 ); /* Muted teal */
    TITLE "Proportion of Sales by Age Group";
    XAXIS LABEL="Total Sales ($)";
RUN;

/* 3. Pie Chart: Age Group Distribution */
PROC GCHART DATA=clean_data;
    PIE AgeGroup / DISCRETE VALUE=INSIDE PERCENT=OUTSIDE  COUTLINE=BLACK ;
    TITLE "Age Group Distribution";
RUN;



/* 4. Stacked Bar Chart: Gender-wise Product Category Preferences */
PROC SGPLOT DATA=clean_data;
    VBAR "Product Category"n / GROUP=Gender GROUPDISPLAY=STACK 
         DATALABEL;
    STYLEATTRS DATACOLORS=(CX4A90E2 CX50E3C2); /* Muted blue and teal for gender */
    TITLE "Gender-wise Preferences for Product Categories";
    XAXIS LABEL="Product Category";
    YAXIS LABEL="Count of Transactions";
RUN;

/* 5. Line Chart: Sales Trends Over Time */
PROC SQL;
    CREATE TABLE monthly_sales AS
    SELECT 
        INTNX('MONTH', Date, 0, 'BEGINNING') AS Month FORMAT=MONYY7.,
        SUM("Total Amount"n) AS Total_Sales
    FROM clean_data
    GROUP BY CALCULATED Month;
QUIT;

PROC SGPLOT DATA=monthly_sales;
    SERIES X=Month Y=Total_Sales / LINEATTRS=(COLOR=CX4A90E2 THICKNESS=2) MARKERS;
    TITLE "Monthly Sales Trends Over Time";
    XAXIS LABEL="Month";
    YAXIS LABEL="Total Sales ($)";
RUN;
