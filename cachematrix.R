######
# assignment 2: matrix version
######

## The pair of functions calculates the inverse of a matrix,
# in a manner that is more efficient for a large matrix. (See
# the benchmarks.R script in the github repo for more details)
# By using R's scoping rules, when solving for inverse of a matrix
# repeatedly, the functions first check if the result is already
# in the cache, if not, it will solve for the inverse and store 
# the inverse in the cache before returning the inverse matrix.
# if the computation required already is in the cache, it retrieves
# from cache to prevent repetitive computations.

# makeCacheMatrix creates a list containing a function to;
# set the value of the matrix,
# get the value of the matrix,
# set the value of inverse of the matrix,
# get the value of inverse of the matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  # with square matrix, use 'solve' to obtain the inverse
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# cacheSolve returns the inverse of the matrix, but checks first 
# if the inverse is already in cache, if it is, retrieves
# from cache instead of solving to return the inverse. if 
# it is not already in the cache, the solving computation
# is carried out and stored into the cache.
cacheSolve <- function(x, ...) {
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
print(cachemean(a)) # getting cached data; 25

# test cases from community TA on coursera course forums
amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
print(amatrix$get()) # Returns original matrix
print(cacheSolve(amatrix)) # Computes, caches, returns matrix inverse
print(amatrix$getinverse()) # Returns matrix inverse
print(cacheSolve(amatrix)) # getting cached data