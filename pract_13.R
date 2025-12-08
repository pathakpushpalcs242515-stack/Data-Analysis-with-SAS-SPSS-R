# ===============================================================
# 13. Identifying & Handling Duplicates
# ===============================================================

library(dplyr)

# Load dataset
sales_df <- read.csv("retail_store_sales.csv")

print("--- ORIGINAL SALES DATA ---")
head(sales_df)

# ---------------------------------------------------------------
# IDENTIFY EXACT DUPLICATES
# ---------------------------------------------------------------

duplicate_rows <- sales_df %>%
  group_by(
    Transaction.ID, Customer.ID, Category, Item,
    Price.Per.Unit, Quantity, Total.Spent,
    Payment.Method, Location, Transaction.Date, Discount.Applied
  ) %>%
  count() %>%
  filter(n > 1)

print("--- DUPLICATES FOUND ---")
duplicate_rows

# ---------------------------------------------------------------
# REMOVE EXACT DUPLICATES
# ---------------------------------------------------------------

clean_sales <- sales_df %>% distinct()

print("--- CLEAN SALES DATA (NO DUPLICATES) ---")
head(clean_sales)

# ---------------------------------------------------------------
# UNIQUE CUSTOMERS ONLY (.keep_all = TRUE)
# ---------------------------------------------------------------

unique_customers <- sales_df %>%
  distinct(Customer.ID, .keep_all = TRUE)

print("--- UNIQUE CUSTOMERS LIST ---")
head(unique_customers)

