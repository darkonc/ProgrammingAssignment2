## Put comments here that give an overall description of what your
## functions do

## MakeCachematrix() takes  a matrix and returns a list of
## functions to work with the matrix.
## set(aMatrix) assigns a new value to the stored matrix (and clears
## the cached inverse)
##
## get() simply returns the value of the cached matrix
## 
## getInverse returns the (possibly cached) value for the inverse matrix.
## 
## Note that I don't have a setInverse() function, since that
## work is done with getInverse() .. and I don't have to 
## worry about cached inverses getting set to arbitrary values
##

makeCacheMatrix <- function(theMatrix = matrix()) {
	theInverse <- NULL
	get= function(){
	    theMatrix
	}
	set= function(newMatrix){
	    theInverse<<- NULL
	    theMatrix<<- newMatrix
	}
	getInverse= function(...) {
	    if(is.null(theInverse)){
	      # print("solving matrix")
	      theInverse <<- solve(theMatrix,...) # pass extra args
	    # }else{
	    #  print("using cache")
	    }
	  theInverse # return inverse 
	}
	
	list( get=get,set=set,getInverse=getInverse)
}


## Cachesolve takes a cached-Matrix object (matObj)
## from MakeCacheMatrix and returns the inverse of the matrix
## 
## Note that -- unlike the examples, I do all of the work of 
## caching inside of matObj$getInverse(), rather than in cacheSolve
## any extra parameters are passed to getInverse() to then
## pass on to solve()

cacheSolve <- function(matObj, ...) {
        ## Return a matrix that is the inverse of 'matObj'
	matObj$getInverse(...)
}
