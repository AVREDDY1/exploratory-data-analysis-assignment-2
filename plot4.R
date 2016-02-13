## These lines read the data and activate ggplot2
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#subsets and greps data to create dataset for plot4
fire<-grep("coal", SCC$Short.Name, ignore.case=TRUE, value=TRUE)  
source<-subset(SCC, Short.Name %in% fire)  
firesource<-subset(NEI, SCC %in% source$SCC)      

#creates Plot 4
png("plot4.png", width=480, height= 480)
pollution <- ggplot(firesource,aes(factor(year),Emissions/10^5)) +
geom_bar(stat="identity",fill="red",width=0.75) +
 theme_bw() +  guides(fill=type) +
labs(x="year", y=expression("Emissions per 10^5 Tons")) +
labs(title=expression("Coal based PM 2.5 emmisons Across US from 1999-2008"))
print(pollution)
dev.off()

## in 1999, coal based PM 2.5 emmisions where high in the Us,
## dropped in 2002 and stayed the same in 2005.
## and fell sharpley in 2008
