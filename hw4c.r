doc <- read.csv("C:/Users/antop/Documents/R/outcome-of-care-measures.csv", colClasses = "character")
states = as.list(unique(doc$State))
states
rankall <- function (problem, num){
  check <- function(problem){
    problems = list("pneumonia", "heart attack", "heart failure" )
    problemok <- is.element(problem, problems)
  }
  c <- check(problem)
  if (c == FALSE){
    print("invalid output")
    break
  }
  p = 17
  if (problem == "heart attack") { p = 11}
  else if (problem == "prnuemonia") { p = 23}
  tabla = doc[ , c(2, 7, p)]
  names(tabla) <- c("Hospital.Name", "State","problem")
  states = as.list(unique(doc$State))
  r <- data.frame("Hospital" = NULL, "State" = NULL)
  for (state in states) {
    t <- subset(tabla, tabla$State == state)
    t <- t[order(as.numeric(t$problem), t$Hospital.Name, method = "shell"), ]
    r <- rbind(r, c(t[num, 1], state))
    t <- tabla
  }
  r
}

result <- rankall("heart attack", 20)
head(result)

