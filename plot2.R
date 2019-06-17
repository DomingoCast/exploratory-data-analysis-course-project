NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
sel <- NEI[which(NEI$fips == "24510"),]
emissionsBaltimore <- tapply(sel$Emissions,as.factor(sel$year), sum)
years <- c(1999,2002,2005,2008)
plot(years, emissionsBaltimore)
dev.copy(png,"plot2.png")    
dev.off()
