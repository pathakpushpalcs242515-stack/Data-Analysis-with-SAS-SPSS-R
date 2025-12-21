# One-Way ANOVA

method <- factor(c("Online","Online","Online",
                   "Offline","Offline","Offline",
                   "Hybrid","Hybrid","Hybrid"))

score <- c(65, 70, 68,
           75, 78, 72,
           80, 85, 82)

df1 <- data.frame(method, score)

anova_one <- aov(score ~ method, data = df1)
summary(anova_one)

