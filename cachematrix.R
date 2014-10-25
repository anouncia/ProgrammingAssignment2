## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mat = matrix()) {
 inv <- NULL
    set <- function(y) {
        mat <<- y
        inv <<- NULL
    }
    get <- function() mat
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(mat, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- mat$getinverse()
    if(!is.null(inv)) {
        message("Get cache data.")
        return(inv)
    }
    data <- mat$get()
    inv <- solve(data)
    mat$setinverse(inv)
    inv

}

Sample Execution:
source("assign2.R")
> mat = rbind(c(1, 2), c(3, 4)
+ )
> m = makeCacheMatrix(mat)
>
> mat$get()
Error in mat$get : $ operator is invalid for atomic vectors
> m$get()
     [,1] [,2]
[1,]    1    2
[2,]    3    4
> cacheSolve(m)
     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5
> cacheSolve(m)
getting cached data.
     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5

