# from https://class.coursera.org/rprog-016/forum/thread?thread_id=563

library("microbenchmark")
setwd("~/Documents/johnhopkins/ProgrammingAssignment2")
source("cachematrix.R")
a = matrix(rnorm(10*10), 10, 10)
b = matrix(rnorm(25*25), 25, 25)
c = matrix(rnorm(50*50), 50, 50)
d = matrix(rnorm(75*75), 75, 75)
e = matrix(rnorm(100*100), 100, 100)
a1 = makeCacheMatrix(a)
b1 = makeCacheMatrix(b)
c1 = makeCacheMatrix(c)
d1 = makeCacheMatrix(d)
e1 = makeCacheMatrix(e)
tm <- microbenchmark(solve(a), solve(b), solve(c), solve(d), solve(e), cacheSolve(a1), cacheSolve(b1), cacheSolve(c1), cacheSolve(d1), cacheSolve(e1), times = 100)
tm