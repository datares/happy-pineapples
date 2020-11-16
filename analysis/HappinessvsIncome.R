#income data from Gallup
income <- read.csv("C:/Users/thehu/Documents/Fall 2020/Data Blog/IncomeByCountry2020.csv", header = TRUE)
happy <- read.csv("C:/Users/thehu/Documents/Fall 2020/Data Blog/2020.csv", header = TRUE)

names(income)[names(income) == "ï..country"] <- "Country.name"

df = merge(income, happy, by = "Country.name")
colnames(df)

plot(Ladder.score ~ medianHouseholdIncome, data = df,
     xlab = "Median Household Income", ylab = "Happiness Score",
     main = "Median Household Income vs. Happiness by Country",
     col = colors[Regional.indicator], pch = 20,
     xlim = c(0, 55000), ylim = c(2.5, 8))

legend("bottomright", levels(df$Regional.indicator), 
       col = colors, pch = 20, inset = 0.01)

fit <- lm(df$Ladder.score ~ log(df$medianHouseholdIncome))
coef <- coef(fit)

curve(coef[1] + coef[2] * log(x), xlim = c(0, 55000), ylim = c(2.5, 8), add = TRUE)

colors <- c("black", "green4", "red", "green", "lightgoldenrod4",
            "navy", "turquoise", "violetred", "slateblue", "deepskyblue2")


