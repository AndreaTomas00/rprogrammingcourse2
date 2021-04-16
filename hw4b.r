doc <- read.csv("C:/Users/antop/Documents/R/outcome-of-care-measures.csv", colClasses = "character")

rankhospital <- function(state, problem, num) {
  source("hw4a.r")
  tabla <- best(state, problem)
  tabla <- data.frame(tabla, problem = as.numeric(tabla$problem))
  tabla <- tabla[ , c(1,2,4)]
  tabla <- na.omit(tabla)
  v = num
  if (num == "worst") { v = nrow(tabla)}
  if (num == "best") { v = 1}
  hospi <- tabla[ v, 1] 
}
r <- rankhospital("MN", "heart attack", "worst")
r
LKN