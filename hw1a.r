directory <- "C:/Users/Usuari_carp/Documents/R"
pollutantmean <- function(directory, pollutant, id=1:332) {
  val =vector()
  for (i in id) {
    f <- sprintf("%03d.csv",i)
    filepath <- paste(directory, f, sep='/')
    table <- read.csv(file= filepath)
    d <- table[,pollutant]
    d <- d[!is.na(d)]
    val <- c(val, d)
  }
  round(mean(val), 3)
  
}
pollutantmean (directory, "nitrate")
