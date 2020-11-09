data2020 <- read.csv("C:/Users/thehu/Documents/Fall 2020/Data Blog/2020.csv", header = TRUE)
head(data)

plot(Healthy.life.expectancy ~ Ladder.score, data = data2020,
     xlab = "Happiness Score", ylab = "Healthy Life Expectancy",
     main = "Life Expectancy vs. Happiness Score (2020)", 
     col = colors[Regional.indicator], pch = 20, xlim = c(2.5, 10)
    )

lm_happiness <- lm(Healthy.life.expectancy ~ Ladder.score, data = data2020)

abline(lm_happiness)

legend("bottomright", levels(data2020$Regional.indicator), 
       col = colors, pch = 20, inset = 0.01)

colors <- c("black", "green4", "red", "green", "lightgoldenrod4",
            "navy", "turquoise", "violetred", "slateblue", "deepskyblue2")
