require(gdata)

files <- list.files(path="/path/to/data", pattern="*.xls", full.names=T, recursive=FALSE)

for (file in files) {
  data = read.xls(file)
  data$Date <- as.Date(data$Date, '%d %b %Y')
  
  #remove first row
  data <- data[-1, ]
  
  data <- subset(data, Date > as.Date("2007-01-01"))
  
  from <- format(min(data$Date), "%Y")
  to <- format(max(data$Date), "%Y")
  
  svg(paste("plots/", basename(file),".svg", sep=""), width = 30/2.54, height = 20/2.54)
  
  plot(data$Date, data$PE, type="l", col="red",
       lwd = 2,
       xaxt="n",
       xlab = "Date",
       ylab = "PE",
       main = basename(file))
  
  # add guidelines
  low <- unname(quantile(data$PE, na.rm = TRUE))[2]
  high <- unname(quantile(data$PE, na.rm = TRUE))[4]
  abline(h=c(low, high), lty=2, col="red")
  
  par(new=TRUE)
  
  plot(data$Date, data$Closing..c., type="l", col="blue", 
       lwd = 2, xaxt="n", yaxt="n", xlab="", ylab="")
  
  axis(1, data$Date, format(data$Date, "%Y"))
  
  axis(4, data$Closing, col.axis="blue")
  
  mtext("Price", side=4, cex.lab=1, las=2)
  
  dev.off()
}
