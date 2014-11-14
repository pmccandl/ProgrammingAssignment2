## The following two functions will solve for a matrix inverse
## with the R function solve() and cache the result
## Once the calculation is done the cached result will be returned
## without rerunning the solve() function

## Usage:
## c <- makeCacheMatrix(mat)
## cacheSolve(c)

## makeCacheMatrix: function creates a list allowing user to 
## set the value of the matrix
## get the value of the matrix
## set the value of the matrix inverse
## get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- matrix()
  cached <<- FALSE
  set <- function(y) {
    x <<- y
    i <<- matrix()
    
  }
  get <- function() x
  setinverse <- function(inverse) {
    cached <<- TRUE
    i <<- inverse
  } 
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  
}


## cacheSolve: function will use the makeCacheMatrix list
## to solve for a matrix inverse and cache the result
## once the inverse is solved for the cached result 
## is returned if the function is called again

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ##i <- matrix()
  i <- x$getinverse()
  if(cached) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
