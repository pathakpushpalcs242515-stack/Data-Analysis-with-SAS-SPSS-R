# Chi-Square Test

data <- matrix(c(30, 20,
                 15, 35),
               nrow = 2,
               byrow = TRUE)

colnames(data) <- c("Product_A", "Product_B")
rownames(data) <- c("Male", "Female")

chisq.test(data)

