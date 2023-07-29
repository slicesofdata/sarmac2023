true_count  <- function(x) {
  if(is.vector(x)) {
    return(sum(x == 0, na.rm = T))
  }
}