NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)

vehicles<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
qplot(year, Emissions, data = vehicles) + geom_smooth(method = "lm")
dev.copy(png,"plot5.png")
dev.off()