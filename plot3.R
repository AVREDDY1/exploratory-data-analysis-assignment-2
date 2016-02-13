## These lines read the data and activate ggplot2
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#subsets and aggregates data for the plot chart
total<- subset(NEI, NEI$fips==24510)
citytotal<- aggregate(Emissions ~ year+type,total,sum)

#create plot3.png
png("plot3.png", width=480, height= 480)
Balt<-ggplot(citytotal,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(Balt)
dev.off()

## Nonpoint was very high in 1999 but decreased in 2002 
## and stayed at that level till 2008 where it decreased slightly
## Non-Road dropped in 2002, rose a little in 2005, and decreased in 2008
## On-Road level in 2002 dropped and stayed 
## around the same in 2005 and fell in 2008
## Point rose in 2002, but really grey high in 2005,
## but sharpley dropped in 2008


