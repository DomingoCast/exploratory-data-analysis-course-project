merged <- merge(NEI, SCC, by = "SCC")
Coal <- grep("Coal", merged$EI.Sector)
sumCoal <- tapply(merged$Emissions[Coal],as.factor(merged$year[Coal]), sum)
sumCoal
qplot(years, sumCoal) + geom_smooth(method = "lm")
dev.copy(png,"plot4.png")
dev.off()
