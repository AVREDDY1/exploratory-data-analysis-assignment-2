## These lines read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#uses aggreate and subset to create a Baltimore emmision dataset for the chart
total<- subset(NEI,NEI$fips==24510)
citytotal<-aggregate(Emissions ~ year,total,sum)

#creates plot 2.png
png("plot2.png", width=480, height=480)
barplot(citytotal$Emissions,
names.arg=citytotal$year, 
ylab="Emission per 10^6 tons",
xlab="Years", 
main="PM2.5 Emissions of Baltimore", 
col = 1:20)
dev.off()

## total emissions from PM2.5 has flucutate in Baltimore
## In 2002 emmisions fall but rise back in 2005 
## to almost the save level as in 1999 but falls again 2008
## to a range lower than 2002
