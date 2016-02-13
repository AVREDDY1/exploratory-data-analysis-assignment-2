## These lines read the data and activate ggplot2
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset and fips data for chart
car <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
pollution <- SCC[car,]$SCC
carpollution <- NEI[NEI$SCC %in% pollution,]
baltimore<-carpollution[carpollution$fips==24510,]

#creates chart for plot5
png("plot5.png", width=480, height= 480)
baltimorepollution<-ggplot(baltimore,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="green",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("PM 2.5 Emissions per 10^5 Tons)")) +
  labs(title=expression("PM 2.5  Emissions from Vehicles in Baltimore (1999-2008"))
print(baltimorepollution)
dev.off()

## In 1999, Baltimore's vehicle emmisions where very high but sharply dropped in 2002
## In 2005, it stayed the same as in 2002, but fell in 2008