## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Create fynction-makeCacheMatrix: creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function( x = matrix() ) {
  
  inv <- NULL                           
  set <- function( matrix ) {         
    x <<- matrix
    inv <<- NULL
  }
  get <- function() x                 
  setInverse <- function(inverse) {    
    inv <<- inverse
  }
  getInverse <- function() inv           
  list(set = set, get = get,           
       setInverse = setInverse,
       getInverse = getInverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()               
  inv <- solve(data) %*% data     
  x$setInverse(inv)             
  inv                           
  
}