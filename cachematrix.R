## Set of helper functions to cache time-consuming matric inversion results

## Helper function to create a special vector to helper functions used
## to cache a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() {
        x
    }
    setinverse <- function(inverse) {
        i <<- inverse
    }
    getinverse <- function() {
        i
    }
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## Helper function that will compute and cache the inverse of a matrix If
## the inverse of a matrix has already been computed (cached), then it will
## quickly return the cached version.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if (!is.null(i)) {
        message("getting cache data")
        return (i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
