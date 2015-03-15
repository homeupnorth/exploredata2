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
dev.copy(png,filename="plot6.png");
dev.off()
