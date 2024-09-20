#' Title euclidean 123
#'
#' @param x 
#' @param y 
#'
#' @return r_2
#' @export
#'
#' @examples euclidean(123612,13892347912)
euclidean <- function(x,y){
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
