## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## My comments:
## The function below creates a special matrix in a few steps
## 1. set the value of the matrix via `set`
## 2. get the value of the matrix via `get`
## 3. set the value of the inverse via `setinv`
## 4. get the value of the inverse via `getinv`

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(y) {
          x <<- y
          m <<- NULL
     }
     get <- function() x
     setinv <- function(solve) m <<- solve
     getinv <- function() m
     list(set = set, get = get,
          setinv = setinv,
          getinv = getinv)
}


## Write a short comment describing this function

## My comments:
## This function calculates the inverse of the special matrix created with the
## function above.
## 1. It checks if the inverse has already been claculated
## 2. If yes, it gets the inverse from the cache skipping the calculation
## 3. If no, it calculates the inverse and stores it in the cache via setinv

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     m <- x$getinv()
     if (!is.null(m)) {
          message("getting cached data")
          return(m)
     }
     data <- x$get()
     m <- solve(data, ...)
     x$setinv(m)
     m
}
## Quick check for lazy checkers ;)
# set.seed(1)
# mat <- matrix(sample(1:10, 100, replace = TRUE), 10, 10)
# inv <- solve(mat)
# x <- makeCacheMatrix(mat)
# cacheSolve(x)
## Thank you! Bye!