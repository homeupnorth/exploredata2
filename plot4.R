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
# QUESTION 4
# ----------
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
#
# Get all coal sources from SCC
#
SCC$Coal<-grepl("coal", SCC$EI.Sector, ignore.case = TRUE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
SCC_Coal<-subset(SCC, Coal==TRUE)
#
# subset NEI with coal fips
#
NEI_Coal<-subset(NEI, SCC %in% SCC_Coal$SCC)
Q4 <- ggplot(NEI_Coal, aes(x=year, y=Emissions)) +
  geom_bar(stat="identity", width=0.5, position="dodge", ) +
  labs(xlab="year", title="Coal Combustion Related Emissions")
Q4
dev.copy(png,filename="plot4.png");
dev.off()

