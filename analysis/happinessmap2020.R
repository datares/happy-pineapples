data <- read.csv("C:/Users/thehu/Documents/Fall 2020/Data Blog/2020.csv", header = TRUE)

library(ggplot2)
library(dplyr)
library(plyr)
require(maps)
require(viridis)
theme_set(
  theme_void()
)

world_map <- map_data("world")
ggplot(world_map, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill="lightgray", colour = "white")

#Rename Country.name column to region to match world map
names(data)[names(data) == "Country.name"] <- "region"

#Replace country names in data to match world map labels
levels(data[, "region"])[30] <- "Republic of Congo"
levels(data[, "region"])[31] <- "Democratic Republic of the Congo"
levels(data[, "region"])[145] <- "UK"
levels(data[, "region"])[146] <- "USA"

happy2020map <- left_join(world_map, data, by = "region")

ggplot(happy2020map, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Ladder.score), color = "white")+
  scale_fill_viridis_c(option = "C")

## No data from following countries:
## Angola, Antarctica, French Guianna, Greenland, Guyana, North Korea, Oman, Papua New Guinea, Sudan, Suriname, Somalia, Syria


