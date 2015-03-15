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
# QUESTION 2
# ----------
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
# system to make a plot answering this question.
#
str(NEI)
baltcity<-subset(NEI, fips=="24510")
str(baltcity)
baltcityyearsum<-aggregate(Emissions ~ year, data = baltcity, sum)
baltcityyearsum   # Check out the data
barplot(baltcityyearsum$Emissions, names.arg=baltcityyearsum$year, main="Total PM2.5 Emissions in Baltimore City")
dev.copy(png,filename="plot2.png");
dev.off()
#
#
