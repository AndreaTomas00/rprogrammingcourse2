doc <- read.csv("C:/Users/antop/Documents/R/outcome-of-care-measures.csv", colClasses = "character")

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
  p = 0
  if (problem == "heart attack") { p = 11}
  else if (problem == "heart failure") { p = 17}
  else if (problem == "pneumonia") { p = 23}
  tabla = doc[ , c(2, 7, p)]
  names(tabla) <- c("Hospital.Name", "State","problem")
  states = sort(as.vector(unique(doc$State)))
  v = as.numeric(num)
  if (num == "best") {
    v = 1}
  if (num == "worst") {v = 0}
  r <- data.frame()
  for (state in states) {
    t <- subset(tabla, tabla$State == state)
    t <- t[order(as.numeric(t$problem), t$Hospital.Name, method = "shell"), ]
    t <- data.frame(t, problem = as.numeric(t$problem))
    t <- na.omit(t)
    t <- t[ ,1:3]
    if (v == 0) {v = nrow(t)}
    r <- rbind(r, c(t[v, 1], state))
    t <- tabla
    if (num == "worst") {v = 0}
  }
  names(r) <- c("Hospital", "State")
  r
}

result <- rankall("heart failure", 10)
result
