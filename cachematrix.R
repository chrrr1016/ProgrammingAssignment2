## The following pair of functions will cache the inverse of a matrix

## The following function will contain a list of functions that will allow the user to set
## and retrieve the value of the matrix,as well as set and retrieve the value of the matrix's inverse


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y=matrix()) {
    x <<- y
    i <- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above
## If the inverse has already been calculated, then the cachesolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse() 
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}
