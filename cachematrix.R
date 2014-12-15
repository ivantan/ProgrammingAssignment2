######
# example: for chaching vectors
######

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

######
# assignment: for matrix
######

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

# test cases
setwd("~/Documents/johnhopkins/ProgrammingAssignment2")
a <- makeVector(c(1,2,3,4))
print(a$get()) # 1 2 3 4
print(a$getmean()) # NULL
print(cachemean(a)) # 2.5
print(a$getmean()) # 2.5
a$set(c(10,20,30,40))
print(a$getmean()) # NULL
print(cachemean(a)) # 25
print(a$getmean()) # 25
print(cachemean(a))
# getting cached data
# 25

amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
print(amatrix$get()) # Returns original matrix
print(cacheSolve(amatrix)) # Computes, caches, returns matrix inverse
print(amatrix$getinverse()) # Returns matrix inverse
print(cacheSolve(amatrix)) # getting cached data