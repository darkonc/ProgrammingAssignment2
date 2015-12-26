## Put comments here that give an overall description of what your
## functions do

## MakeCachematrix() takes  a matrix and returns a list of
## functions to work with the matrix.
## set(aMatrix) assigns a new value to the stored matrix (and clears
## the cached inverse)
##
## get() simply returns the value of the cached matrix
##
## setInvese(aMatrix) sets a cached value for the inverse matrix
## 
## getInverse returns the cached value for the inverse matrix.

makeCacheMatrix <- function(theMatrix = matrix()) {
	theInverse <- NULL
	get= function(){
	    theMatrix
	}
	set= function(newMatrix){
	    theMatrix<<- newMatrix
	    theInverse<<- NULL
	}
	getInverse= function() {
	    theInverse
	}
	setInverse= function(newInverse){
	    theInverse <<- newInverse
	}
	list( get=get,set=set,getInverse=getInverse,setInverse=setInverse)
}


## Cachesolve takes a cached-Matrix object (matObj)
## from MakeCacheMatrix and returns the inverse of the matrix
## if the invese has already been calculated and returned, then 
## Cachesolve returns the cached value, otherwise it calculates
## a new inverse, caches that, and returns the (newly cached) inverse

cacheSolve <- function(matObj, ...) {
        ## Return a matrix that is the inverse of 'matObj'
	theResult=matObj$getInverse()
	if(is.null(theResult)){
	    print("setting cache")
	    theResult= solve(matObj$get(),...)
	    matObj$setInverse(theResult)
	}else{
	    print("using cache")
	}
	    theResult
}
