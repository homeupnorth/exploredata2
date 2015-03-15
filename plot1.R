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
# QUESTION 1
# ----------
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot showing the 
# total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#
yearsum<-aggregate(Emissions ~ year, data = NEI, sum)
yearsum    # Check out the data
barplot(yearsum$Emissions, names.arg=yearsum$year, main="Total PM2.5 Emissions in US")
dev.copy(png,filename="plot1.png");
dev.off()
#
#
