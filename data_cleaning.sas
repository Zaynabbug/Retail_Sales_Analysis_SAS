/* Import the Dataset */
PROC IMPORT DATAFILE='/home/u64114351/retail_sales_data/retail_sales_data.csv'
   OUT=sales_data
   DBMS=CSV
   REPLACE;
GETNAMES=YES;
RUN;

/* Preview the Dataset */
PROC PRINT DATA=sales_data (OBS=10);
RUN;

/* 1. Removing Duplicates */
PROC SORT DATA=sales_data NODUPKEY OUT=clean_data_1;
    BY _ALL_;
RUN;

PROC PRINT DATA=clean_data_1;
RUN;

/* 2. Correcting Incorrect Values */
DATA clean_data_2;
  SET clean_data_1; 
  /* Standardize Product Category */
  IF UPCASE("Product Category"n) IN ("BEAUTE", "BEAUTY") THEN "Product Category"n = "Beauty";
  IF UPCASE("Product Category"n) IN ("CLOTHES", "CLOTHING") THEN "Product Category"n = "Clothing";
RUN;
PROC PRINT DATA=clean_data_2;
RUN;


/* 3. Removing Extra Spaces */
DATA clean_data_3;
    SET clean_data_2;
    "Customer ID"n = COMPRESS("Customer ID"n); /* Removes leading and trailing spaces */
RUN;
PROC PRINT DATA=clean_data_3;
RUN;

/* 4. Handling Missing Data */
DATA clean_data_4;
  SET clean_data_3;
  IF "Transaction ID"n = '87' THEN "Customer ID"n = 'CUST087';
  IF "Transaction ID"n = '467' THEN Date = INPUT('30/07/2023', DDMMYY10.);
  IF "Transaction ID"n = '804' THEN Date = INPUT('24/08/2023', DDMMYY10.);
RUN;
PROC PRINT DATA=clean_data_4;
RUN;

/* 5. Adding Age Group Variable */
DATA clean_data_5;
  SET clean_data_4;
  IF age < 30 THEN AgeGroup = 'Young Adults';
  ELSE IF age >= 30 AND age < 45 THEN AgeGroup = 'Middle-aged Adults';
  ELSE IF age >= 45 THEN AgeGroup = 'Older Adults';
  ELSE AgeGroup = 'Unknown';
RUN;
PROC PRINT DATA=clean_data_5;
RUN;

/* Export the Cleaned Data */
PROC EXPORT DATA=clean_data_5
   OUTFILE='/home/u64114351/retail_sales_data/cleaned_sales_data.csv'
   DBMS=CSV
   REPLACE;
RUN;
