
## These lines read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#aggregate the totals so that we can for the bar chart
totals <- aggregate(Emissions ~ year,NEI, sum)


# creating Plot1.png
png("plot1.png", width=480, height= 480)
barplot( (totals$Emissions)/10^6,
names.arg=totals$year, 
ylab="Emission per 10^6 tons",
xlab="Years", 
 main=" PM2.5 Emissions of USA", 
col = 1:20)
dev.off()
## The chart shows that emissions from PM2.5 has decreased from 1999 to 2008.
