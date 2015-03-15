setwd("~/Documents/Coursera/Exploratory Data Analysis/exploredata2")
#
# Read the data
#
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#
str(NEI)
str(SCC)
head(SCC)
summary(NEI)

#
#
NEI$Pollutant<-as.factor(NEI$Pollutant)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)
#
hist(NEI$Emissions)
hist(log(subset(NEI$Emissions, NEI$year=="1999")))
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
#
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
Q3 <- ggplot(baltcity, aes(x=year, y=Emissions, fill=type)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="Emission in Baltimore by Type & Year")
Q3
#
#
# QUESTION 4
# ----------
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
#
SCC$Coal<-grepl("coal", SCC$EI.Sector, ignore.case = TRUE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
SCC_Coal<-subset(SCC, Coal==TRUE)
NEI_Coal<-subset(NEI, SCC %in% SCC_Coal$SCC)
Q4 <- ggplot(NEI_Coal, aes(x=year, y=Emissions)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="Coal Combustion Related Emissions")
Q4
#
#
# QUESTION 5
# ----------
# How have emissions from motor vehicle sources changed from 
# 1999–2008 in Baltimore City?
# 
baltcity<-subset(NEI, fips=="24510")
Q5 <- ggplot(subset(baltcity, type=="ON-ROAD"), aes(x=year, y=Emissions)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="On-road Motor Vehicle Emissions in Baltimore")
Q5
#
#
# QUESTION 6
# ----------
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?
#
MV_counties<-subset(NEI, fips=="24510"|fips=="06037")
MV_compare<-subset(MV_counties, type=="ON-ROAD")
Q6 <- ggplot(MV_compare, aes(x=year, y=Emissions, fill=fips)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="Motor Vehicle Emissions in Baltimore City 24510 vs Los Angeles 06037 Counties")
Q6

