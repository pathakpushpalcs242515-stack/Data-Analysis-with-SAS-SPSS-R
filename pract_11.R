# ===============================================================
# 11. Reshaping Data using pivot_longer() and pivot_wider()
# ===============================================================

library(dplyr)
library(tidyr)

# 1. Load dataset
df <- read.csv("retail_store_sales.csv", na.strings = c("", "NA")) %>%
  mutate(RowID = row_number()) %>%   # Helps track rows
  select(RowID, Category, Item, Price.Per.Unit, Quantity, Total.Spent)

print("--- ORIGINAL DATA ---")
head(df)

# ===============================================================
# 2. PIVOT_LONGER (Wide → Long)
# Combine Price, Quantity, Total Spent into a single column
# ===============================================================

long_df <- df %>%
  pivot_longer(
    cols = c(Price.Per.Unit, Quantity, Total.Spent),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- LONG FORMAT ---")
head(long_df, 10)

# ===============================================================
# 3. PIVOT_WIDER (Long → Wide)
# ===============================================================

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- WIDE FORMAT (BACK TO ORIGINAL) ---")
head(wide_df)

# ===============================================================
# 4. CATEGORY-WISE RESHAPED PRICE TABLE
# ===============================================================

category_price <- df %>%
  select(RowID, Category, Price.Per.Unit) %>%
  pivot_wider(
    names_from = Category,
    values_from = Price.Per.Unit
  )

print("--- CATEGORY PRICE PIVOT ---")
head(category_price)

