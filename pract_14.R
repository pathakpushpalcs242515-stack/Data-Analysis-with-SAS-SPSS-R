# ===============================================================
# 14. Extracting Date Components using lubridate
# ===============================================================

library(lubridate)
library(dplyr)

df <- read.csv("retail_store_sales.csv")

# Convert Transaction Date to proper Date format
df_processed <- df %>%
  mutate(
    TransactionDate = ymd(Transaction.Date),
    
    Year = year(TransactionDate),
    Month = month(TransactionDate),
    Month_Name = month(TransactionDate, label = TRUE),
    Day = day(TransactionDate),
    Weekday = wday(TransactionDate, label = TRUE, abbr = FALSE),
    Quarter = quarter(TransactionDate),
    Day_of_Year = yday(TransactionDate)
  )

print("--- DATE COMPONENTS ADDED ---")
head(df_processed)

# CURRENT SYSTEM DATE
now_time <- now()
print(paste("Current Year:", year(now_time)))
print(paste("Current Month:", month(now_time)))
print(paste("Current Hour:", hour(now_time)))
