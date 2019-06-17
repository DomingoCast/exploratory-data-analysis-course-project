direc <- "C:/Users/aquad/Desktop/Plan/Data/Exploratory analisis/exdata_data_NEI_data"
setwd(direc)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


merged <- merge(NEI, SCC, by = "SCC")
Coal <- grep("Coal", merged$EI.Sector)
sumCoal <- tapply(merged$Emissions[Coal],as.factor(merged$year[Coal]), sum)
sumCoal
qplot(years, sumCoal) + geom_smooth(method = "lm")
dev.copy(png,"plot4.png")
dev.off()
