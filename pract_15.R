# ===============================================================
# 15. Generating Basic Summaries using str() and summary()
# ===============================================================

df <- read.csv("retail_store_sales.csv")

print("--- DATA LOADED ---")
head(df)

# ---------------------------------------------------------------
# STRUCTURE OF THE DATA
# ---------------------------------------------------------------
print("--- OUTPUT OF str() ---")
str(df)

# ---------------------------------------------------------------
# STATISTICAL SUMMARY
# ---------------------------------------------------------------
print("--- OUTPUT OF summary() ---")
summary(df)

# ---------------------------------------------------------------
# IMPROVE SUMMARY BY CONVERTING CATEGORY TO FACTOR
# ---------------------------------------------------------------
df$Category <- as.factor(df$Category)

print("--- SUMMARY AFTER FACTOR CONVERSION ---")
summary(df)

# ---------------------------------------------------------------
# SPECIFIC SUMMARY VALUES
# ---------------------------------------------------------------
avg_spent <- mean(df$Total.Spent, na.rm = TRUE)
max_price <- max(df$Price.Per.Unit, na.rm = TRUE)

print(paste("Average Total Spent:", avg_spent))
print(paste("Highest Price Per Unit:", max_price))
