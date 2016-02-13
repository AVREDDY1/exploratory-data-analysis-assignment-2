## These lines read the data and activate ggplot2
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds") 

# creates variables from datafiles
car <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
pollution <- SCC[car,]$SCC
carpollution <- NEI[NEI$SCC %in% pollution,]

#uses variables to make data for the Plot
Baltimore <- carpollution[carpollution$fips == 24510,]
Baltimore$city <- "Baltimore City"
LosAngeles<-carpollution[carpollution$fips == "06037",]
LosAngeles$city<- "Los Angeles County"
twocities<- rbind(Baltimore,LosAngeles)

#creates plot 6 Chart
png("plot6.png", width=480, height= 480)
eastwest <- ggplot(twocities, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill="orange"),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("PM 2.5 Vehicle Emissions in Kilo-Tons")) +
  labs(title=expression("PM 2.5 Vehicle Emissions in Baltimore & LA, 1999-2008"))
print(eastwest)
dev.off()

## Los Angeles has a much higher amound of emmission than Baltimore.
## However the changes over is higher in Los Angeles than Baltimore
## Baltimore's emission levels decline steadly
## From 2002 to 2005, Los Angeles' emmision levels spike 
## but from 2005 to 2008, they shrink.