#' Calculate the greatest common divisor of two numbers
#' 
#'   The function uses Euclidean algorithm to find the greatest common divisor 
#'   of two numbers.
#'   
#' @param x,y A pair of input integers.
#' 
#' @return r_2 The greatest common divisor of two numbers.
#' 
#' @export
#'
#' @seealso  \url{https://en.wikipedia.org/wiki/Euclidean_algorithm} for more 
#'   information about Euclidean algorithm.
#'   
#' @examples euclidean(123612,13892347912)
euclidean <- function(x,y){
  x <- abs(x) 
  y <- abs(y)
  stopifnot(is.numeric(x), length(x) == 1 )
  stopifnot(is.numeric(y), length(y) == 1 )
  if (x == 0 && y == 0) { 
    stop("non-numeric argument") 
    }
  if (x == 0) {
    return(y) 
  }
  if (y == 0){ 
    return(x)
  }
  if(x>=y){
    r_1 <- x
    r_2 <- y
  }
  else{
    r_1 <- y
    r_2 <- x
  }
  repeat{
    q <- r_1%/%r_2
    r_0 <- r_1%%r_2
    if(r_0==0){
      break
    }
    r_1 <- r_2
    r_2 <- r_0
  }
  return(r_2)
}

