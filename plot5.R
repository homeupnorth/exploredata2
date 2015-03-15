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
dev.copy(png,filename="plot5.png");
dev.off()
#
#
