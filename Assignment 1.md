# Assignment 1

## Part 1: Visualization critique

In this critique, I am using a visualization on [Income Mobility Charts](https://www.nytimes.com/interactive/2018/03/27/upshot/make-your-own-mobility-animation.html) By [EMILY BADGER](https://www.nytimes.com/by/emily-badger), [CLAIRE CAIN MILLER](http://www.nytimes.com/by/claire-cain-miller), [ADAM PEARCE](https://www.nytimes.com/by/adam-pearce) and [KEVIN QUEALY](http://www.nytimes.com/by/kevin-quealy) made in 2018.

The authors made several animated charts (all in one format) to present their findings in how social stratification changes in one generation. The study compared stratification between different groups, for example, white boys vs. girls, white vs. black boys,  Asian-Americans vs. whites etc. and within a certain race. The research was based on data about virtually 50,000 Americans now in their late 30s (those born between 1978 and 1983). The charts shows the movement of Americans from the class of their family of origion to their current class; it is informative that it shows the actual flow of people so we can see, for example, almost only white girls who grew up poor can became a rich adult. The main finding is that 

> 'white men earn more than almost anyone else. They earn more than black men *and* they earn more than white women. Both gender and race contribute to inequality, and white men hold advantages in both ways. 

### Truthful

Assuming all demographic data is reliable, the charts are truthful that includes no hidden data or misleading features. They simply categorizing people into different groups by their demographic information and calculating the percentage of each group. Thus it is fairly trustable since there is no data hidden in adding up, rounding, or averaging. However, the charts do not show the distribution of classes or the composition of each class of the participants' original family nor do they show the distribution of their current classes as a big picture. Also, there is no information about how they define each income class, a different definition may give a different result. Thus I would not argue that the charts in the report are perfect since they do not show the trend of changes from past to present in numbers. The truthfulness can be improved by labeling the percentage of class of family of origin and the distribution of the two comparable demographic groups.

### Functional

As I mentioned before, the charts are functional because an animated chart is exactly what they need to visualise the movement of social stratification. Each individual is presented as a purple or green square moving from classes on the left-hand-side (family of origin) to the right-hand-side (current family) so the audience can see the distribution of each class at first sight. However, as I mentioned before, the charts do not show the trend of change for each class. They are too fancy that they only focus on showing the flow of people yet ignore the bigger picture. If the purpose of the research is to illustrate income inequality and display the change, a slope chart may give a better view. 

However, consider the report is published on New York Times, a important part of the presentation is to attract audience. Such charts are interesting, new, beautiful and clear for the reader. From this view, the auther's choice of form of visualisation is effective.

### Beautiful

The charts are beautiful that they are presented in a simple, clear and elegant way. The colors representing two groups for comparison are in clear contrast, which made the charts very easy to read. The combination of purple and green is aesthetically pleasing. Despite the charts fail to show a bigger picture of the distribution of social class nor the trend of change in class, it efficiently illustrates the flow of individual from their original class to acquired class. From this perspective, the charts are beautiful by way of simplicity.

### Insightful

There are several findings from the visualisations. For example, in the first chart illustrates a spontaneous insight: 

> White boys who grow up rich are likely to remain that way, while black boys raised in similarly wealthy households are more likely to fall to the bottom than stay at the top in their own adult households.

It is clear in the chart that there are more greens (representing white boys) than purples (representing black boys) flow into Upper-middle-class or Rich whereas classes equal or below middle class are more purple than green. 

More interestingly, comparing charts of 'Black and white girls raised in poor families, as measured by individual income' and 'Black and white girls raised in poor families, as measured by household income', we can see both black and white women raised in poor families earn more similar amounts as individuals in adulthood. Further reseach has shown they also worked a similar number of hours per week, made about the same amount of money per hour and share similar occupations. However, though black and white girls have similar level of individual ability, white girls are more likely to marry into a wealthier family, thus their household income outweight that of black women's.

Above all, the charts, to some extent, provide both spontaneous and knowledge-building insights.

### Enlightening

Overall, I deem this topic of research is important for sociology studies, especially researches in social stratification or income inequality. The charts illustrates the mobility of income and the flow of people from their original class to adulthood class. We can see obvious upward flow of white people yet there blacks are more likely to fall to the bottom. Also, white men earn more than almost all other groups, including white women. Comparing individual incomes, white men fare better than white women, partially because they are more likely to be employed.

The charts demostrate two contributors of income inequaility: race and gender. White men stand on the top of the food chain holding advantages in both ways. The authors 'did good with data' that they processed the data to provide useful insights for social study as income equality has always been a crucial part of people's well-being. These charts can act as evidence of inequality of races and of gender. They emphasises the need of regulation or other form of improvement or offering to help reduce the income gap between races and gender, for example offer more education resources for black children or increase monitor on employment discrimination.

However, notwithstanding the topic matter to most, the charts only display the appearance of the phenomenon yet do not dig into insights below the surface. For example, what made white men more competitve than others? How about people in different race with same level of education? How vary are the education level of individuals from families with comparable income? What are the occupation of high-income group? Those are some further research can be done using the same dataset to make the research more insightful.

## Part 2: `ggplot2` and the grammar of graphics

In this part, I am using the [Chicago Crime Rate dataset](https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2/) to illustrate the distribution of violent crimes in Chicago and near the University of Chicago.

![image](https://user-images.githubusercontent.com/22485624/38532959-06644620-3c45-11e8-86e7-9f7dcd881e79.png)

### The Story - Why this topic

Sixty-one victims have been shot in Chicago in the first six days of 2017, and 4368 were shot in 2016 alone, according to [Chicago Tribune](http://crime.chicagotribune.com/chicago/). In 2015, the most recent year for which data is available for both cities, the fatal shooting rate in Chicago was five times as high as it was in New York: 15.6 per 100,000 residents compared to 2.8 per 100,000. According to a report by the University of Chicago Crime Lab, there were 762 homicides in 2016, which was about 58 percent more than in the previous year. But homicides were not the only category of crime to rise: other gun offenses, including nonfatal shootings and robberies, soared. 

President Donald Trump has been targeting the gun violence in Chicago for his opinion on guns since the beginning of his campaign. On Jan. 2nd, 2017, he tweeted: "the city’s murder rate was 'record setting' "and suggested that Mayor Rahm Emanuel should seek federal help if he “can’t do it” himself. The underlying dynamics driving the change maybe too complicated to reverse and to quantitatively understand. For ordinary people, the best we can do is to stay away from troubles whenever we can. People who have stayed in a city should know where the troubles are. But what about new-comers such as newly arrived international students from overseas who have little knowledge about Chicago? As a student it might be beneficial to know how dangerous it is to be studying in Chicago and particularly what kind of common senses we should employ if we were to live in a crime- filled metropolis. A crime map can be useful for anyone in the city who is looking for accomondation or even place to work.	

### Data

The dataset (1.37 Giga-bytes in .csv format) that is used in this visualisation contains comprehensive information on more than 6,000,000 crimes reported by the Chicago Police Department (CPD) since 2001. The variables include information such as the GPS coordinates, the block, the police district, the community area, description of the location where the incident occurred, the date and time when it occurred and its category, etc. All the variables are discrete if not categorical. Data cleaning and filtering are further performed with the “data.table” package. The map is done with the “ggplot” and “ggmap” packages. The data is subsetted by ‘Year’ greater or equal to 2007. This is because 1) data more than 10 years ago is likely to be irrelevant to current trends, and 2) the size of the data is simply huge and takes too much time to run. Number of reported crimes since 2007 in Chicago sums up to 3,420,383. 

Then I filtered the data to include only violent crimes - crimes that can result in bodily harm to victims. These crimes include 1st and 2nd degree murder, criminal sexual assault, robbery, aggravated assault and battery, burglary, and kidnapping. All processed data points are plotted in the graph.

### Visualisation

I choose to display this dataset in a map so that the density and types of crime can be delivered to the readers simply and clearly. For example, we can see from the graph of violent crime in Chicago (on the left), communities with higher violent crime density include Austin, West Garfield Park, East Garfield Park, North Lawndale etc.; and the safest areas are South Lawndale, Lower West Side, Archer Height and north of Chinatown. Zoom in to the area near the University (on the right), we can see a distinct pattern that there is no reported violent crime within the campus, the majority of crime commited are robbery and battery; there are some sexual assault in the north of Washinton Park and in Woodlawn. More frequent and serious crime are commited in the south of the campus and arount Washington Park, including some homicides. 		

I pick pink to present homicide, which is the most concerned crime, and green to present robbery so that more serious crime are highlighted whilst the most common crime (robbery) can still be noticed. Also, other forms of violent crime that are widely concerned, such as sexual assault, are mark in orange - in contrast of green - so that it represent a less serious crime than those marked in pink yet can be easily distinguished. Further, the size of the label for homicide is larger than others, showing it is more noteworthy. The transparency of labels of crimes are tuned down thus annotations on the map is not covered.

For the map of Chicago, I scaled the graph that the canvas includes just the northest and southest point of Chicago and put the city in the middle of the graph. In order to have a closer look around the University of Chicago, I zoomed the map to center at the campus and includes areas with frequent student activites.			

Above all, with the purpose of alarming people to avoid areas with more violent crimes, I decide to deliver the information through a map so the audience can have a spatial idea on where to go and where to bypass. The color of the labels are carefully selected so information on types of crime can be transferred efficiently. Such form of visualisation is effective because it is clear enough for audiences to read and to receive information effortlessly.

