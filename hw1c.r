directory <- "C:/Users/Usuari_carp/Documents/R"
correlation <- function(directory, threshold = 0){
  cr <- vector()
  i = 1
  while(i <= 332){
    f <- sprintf("%03d.csv",i)
    filepath <- paste(directory, f, sep='/')
    t <- read.csv(file= filepath)
    t <- na.omit(t)
    completos = nrow(t)
    if(completos >= threshold){
      c <- cor(t[["sulfate"]],t[["nitrate"]])
      cr <- c(cr, c)
    }
    completos = 0 
    i = i+1
  }
  cr
}

corr <- correlation(directory, 1000)
