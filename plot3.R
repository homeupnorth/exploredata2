setwd("~/Documents/Coursera/Exploratory Data Analysis/exploredata2")
#
# Read the data
#
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#
# Examine Data
#
str(NEI)
str(SCC)
head(SCC)
summary(NEI)
#
# Convert data to useful datatypes
#
NEI$Pollutant<-as.factor(NEI$Pollutant)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)
#
#
# QUESTION 3
# ----------
# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have 
# seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
# system to make a plot answer this question.
#
install.packages("ggplot2")
library(ggplot2)
#
baltcity<-subset(NEI, fips=="24510")
Q3 <- ggplot(baltcity, aes(x=year, y=Emissions, fill=type)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="Emission in Baltimore by Type & Year")
Q3
dev.copy(png,filename="plot3.png");
dev.off()
#
#