direc <- "C:/Users/aquad/Desktop/Plan/Data/Exploratory analisis/exdata_data_NEI_data"
setwd(direc)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)

dat <- summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions =sum(Emissions))#es como un tapply pero con varios factors, simplemente OP

qplot(year, Emissions, data = dat, facets = .~ type) + geom_smooth(method = "lm")
dev.copy(png,"plot3.png")
dev.off()
