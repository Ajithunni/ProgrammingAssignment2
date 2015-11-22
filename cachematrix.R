## This function creates a special "matrix" object that can cache its inverse
## This is achieved by creating a list that contains functions to
## -- Set the value of matrix
## -- Get the value of matrix
## -- Set the value of inverse matrix
## -- Ger the value of invese matrix

makeCacheMatrix <- function(x = matrix())
{
  invM <- NULL
  
  #Set Function
  set <- function(y)
  {
    
  }
  
  #Get Function
  get <- function() x
  
  #Set Inverse Function
  setinverse <- function(inverseM) invM <<- inverseM
  
  # Get Inverse Function
  getinverse <- function() invM
  
  #Return the list with Functions
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
  
}

## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then cacheSolve 
## should retrieve the inverse from the cache.
cacheSolve <- function(x, ...)
{
  invM <- x$getinverse()
  
  if(!is.null(invM)) {
    message("getting cached data.")
    return(invM)
  }
  data <- x$get()
  
  invM <- solve(data)
  
  x$setinverse(invM)
  
  invM
}

##Run script
#x = rbind(c(1, -.75), c(-.755, 1))
#m = makeCacheMatrix(x)
#cacheSolve(m)
#cacheSolve(m)

