doc <- read.csv("C:/Users/antop/Documents/R/outcome-of-care-measures.csv", colClasses = "character")

best <- function(state, problem) {
  problems = list("pneumonia", "heart attack", "heart failure" )
  states = as.list(unique(doc$State))
  check <- function(state, problem){
    stateok <- is.element(state, states)
    problemok <- is.element(problem, problems)
    r <- problemok && stateok
    r
  }
  c <- check(state, problem)
  if (c == FALSE) {print("invalid arguments") 
    break}
  p = 17
  if (problem == "heart attack") { p = 11}
  else if (problem == "pneumonia") { p = 23}
  tabla = doc[ , c(2, 7, p)]
  names(tabla) <- c("Hospital.Name", "State","problem")
  tabla <- subset(tabla, tabla$State == state)
  tabla <- tabla[order(as.numeric(tabla$problem), tabla$Hospital.Name, method = "shell"), ]
  }
r <- best("AK", "pneumonia")
r
