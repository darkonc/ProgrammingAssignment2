## Put comments here that give an overall description of what your
## functions do

#### MakeCachematrix() takes  a matrix and returns a list of
## functions to work with the matrix.
##
### set(aMatrix) assigns a new value to the stored matrix (and clears
## the cached inverse)
##
### get() simply returns the value of the cached matrix
## 
### getInverse() returns the (possibly cached) value for the inverse matrix.
## 
## Note that I don't have a setInverse() function, since that
## work is done with getInverse() .. and I don't have to 
## worry about cached inverses getting set to arbitrary values
##

makeCacheMatrix <- function(firstMatrix = matrix()) {
    theMatrix<- firstMatrix
    theInverse <- NULL
    get= function(){
        theMatrix
    }
    set <- function(newMatrix){
        theInverse<<- NULL
        theMatrix<<- newMatrix
    }
    getInverse <- function(...) {
        theInverse # return inverse   
    }
    setInverse <- function(newInverse){
        theInverse<<-newInverse
    }
    
    list( get=get,set=set,getInverse=getInverse,setInverse=setInverse)
}


## Cachesolve takes a cached-Matrix object (matObj)
## from MakeCacheMatrix and returns the inverse of the matrix
## 
## If there is already a cached inverse,
## then return that instead of doing the work again.

cacheSolve <- function(matObj, ...) {
    ## get the (potentially) cached result
      result=matObj$getInverse(...)
      
      if(is.null(result)){  # No cached result
          # print("calculating inverse")
          result=solve(matObj$get(),...)
          matObj$setInverse(result)  # set the cache
      }
      result # return the result
    }
