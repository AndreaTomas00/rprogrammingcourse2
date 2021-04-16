directory <- "C:/Users/Usuari_carp/Documents/R"

complete <- function (directory, id=1:332){
  completos = 0
  datos <- data.frame()
  for(i in id){
    f <- sprintf("%03d.csv",i)
    filepath <- paste(directory, f, sep='/')
    t <- read.csv(file= filepath)
    t <- na.omit(t)
    completos = nrow(t)
    fila = list(i, completos)
    datos = rbind(datos, fila)
  }
  colnames(datos) <- c("id", "completos")
  datos
}
complete(directory,  54)
