# Two-Way ANOVA

study_hours <- factor(c("Low","Low","High","High",
                        "Low","Low","High","High"))

gender <- factor(c("Male","Female","Male","Female",
                   "Male","Female","Male","Female"))

score <- c(60, 62, 75, 78,
           58, 61, 73, 77)

df2 <- data.frame(study_hours, gender, score)

anova_two <- aov(score ~ study_hours * gender, data = df2)
summary(anova_two)

