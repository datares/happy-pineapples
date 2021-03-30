# World Happiness Analysis

Throughout history, humans have searched for "happiness", but what really drives our perceptions of happiness? Team Happy Pineapples at UCLA DataRes attempted to address this question in the article "Don't Worry, Be Happy". This repository contains all the code, analyses, and explanations for the visualizations and discoveries found in the aforementioned article.

Contributors: [Rachel Li](https://github.com/rachelli99), [William Huang](https://github.com/whuang37), [Charisse Hung](https://github.com/charissehung), [Charlotte Huang](https://github.com/charlotte0408), [Aarushi Gupta](https://github.com/gupta-aarushi).

# Data
The data primarily used to develop our Medium article came from [here](https://www.kaggle.com/mathurinache/world-happiness-report). This data is sourced from the World Happiness Reports, which includes values for 153 countries from the years 2015 to 2020. Many of our analyses focus on the 2020 dataset. The previous datasets have different metrics for each of the columns. If interested in the values for previous years, please refer to the World Happiness Report 2015-2019 for that data.

The data set contained the following columns:
* `Country name` - Name of the country.
* `Regional indicator` - Region of the country.
* `Ladder score` - The happiness score, or subjective well-being of the country. Taken from a Gallup World Poll survey which asks people to rank their life from 0 to 10 with 10 being the best possible life and 0 being the worst possible life.
* `standard error of ladder score` - The standard deviation of the ladder score in comparison to ladder scores from all countries.
* `upperwhisker` - The value of the upper whisker of the ladder score.
* `lowerwhisker` - The value of the lower whisker of the ladder score.
* `Logged GDP per capita` - Gross domestic product (purchasing power parity) per capita logged.
* `Social support` - Average of the binary responses(0 or 1) to the question "If you were in trouble, do you have relatives or friends you can count on to help you whenever you need them, or not?".
* `Healthy life expectancy` - Life expectancy of healthy individuals taken from the World Health Organization's Global Health Observatory.
* `Freedom to make life choices` - National average of responses to the question "Are you satisfied or dissatisfied with your freedom to choose what you do with your life?".
* `Generosity` - Residual of regressing national average of response to the question "Have you donated money to a charity in the past month?".
* `Perceptions of corruption` - The national average to the survey response to two question, "Is corruption widespread throughout the government or not" and "Is corruption widespread within businesses or not?". Data is the average of these two binary responses. If perception of government corruption was missing, only perception of business corruption is used.
* `Ladder score in Dystopia` - An unknown data column with the only value being 1.972316742.
* `Explained by: Log GDP per capita` - Unknown.
* `Explained by: Social support` - Unknown.
* `Explained by: Healthy life expectancy` - Unknown.
* `Explained by: Freedom to make life choices` - Unknown.
* `Explained by: Generosity` - Unknown.
* `Explained by: Perceptions of corruption` - Unknown.
* `Dystopia + residual` - Unknown.

# Data Processing
Many of the features in the dataset were presumably added by the Kaggle poster in their analyses. For our purposes, we chose to drop `standard error of ladder score`,  `upperwhisker`, `lowerwhisker`, `Ladder score in Dystopia`, `Explained by: Log GDP per capita`, `Explained by Social support`, `Explained by: Healthy life expectancy`, `Explained by: freedom to make life choices`, `Explained by: Generosity`, `Explained by Perceptions of corruption`, and `Dystopia + residual` as we either did not know what the feature meant or opted to use calculate the value ourselves. Of these remaining features, there were no NaN or missing values. This dataset was difficult to interpret as data for previous years clearly had values in different ranges for the same features. We had to either normalize these values or avoid time based analyses in our work. To add, many of our analyses included the use of the Python library Folium. In order to use Folium, we had to replace the names of certain countries in the dataset with their corresponding name in the geojson file used in Folium.

# Analysis and Code
The analysis can be found at [analysis/](https://github.com/datares/happy-pineapples/tree/main/analysis). Each member of our team contributed to developing visualizations for our article. The code for each visualization is split into a separate Jupyter notebook or R script. Members on our team were free to use any platform or coding language in their analyses. Thus, our analyses contain a mix of Python, R, and Tableau scripts and notebooks. Python analyses use NumPy, pandas, Matplotlib, Seaborn, and Folium for both the analyses and visualizations.

## Research Questions

### How Do We Tackle This Data?
At first glance, the data in the Happiness Report seemed very convoluted. After cleaning the data, we chose to create a correlation matrix between all features to find where to start. Our findings can be found in the visualization we created [here](https://github.com/datares/happy-pineapples/blob/main/visualization/value_correlation.png).

### Do We Perceive Less Corruption With Wealth?
Living in the US, we tend to perceive poorer countries as more corrupt, but is this really the case? By taking a scatter plot of all countries with the perception of corruption on the y-axis and the logged GDP per capita on the x-axis, we create a visualization that answers this question. The visualization can be found [here](https://github.com/datares/happy-pineapples/blob/main/visualization/corruptionvgdp.png).

### Do Regions Correlate With Happiness?
Often times, the region a country is in reflects the overall wealth and culture of the countries in it. Does this still hold true with perceived happiness? To answer this question we created a violin plot of all the major regions included in the dataset based on the density of ladder score. The visualization can be found [here](https://github.com/datares/happy-pineapples/blob/main/visualization/regionalviolin.png). We continued by conducting a principal components analysis on all the countries and labeling them by their respective region. Do all the features of the dataset behave similarly in the local regions? Visualization of the principal components analysis found [here](https://github.com/datares/happy-pineapples/blob/main/visualization/PCARegion.png).

### How Does Social Support Relate to Wealth and Happiness?
Are humans more likely to perceive that they have support if they are wealthier? Does social support mean a better perceived life? In an attempt to answer this question, we created a scatter plot of all the countries with the logged GDP per capita on the x-axis and the social support on the y-axis. Each point's size was then scaled and colored with the (ladder score)^2. The visualization can be found [here](https://github.com/datares/happy-pineapples/blob/main/visualization/supportgdpladder.png).



