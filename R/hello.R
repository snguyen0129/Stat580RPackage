#' 'Hello' example function
#'
#' Function for saying hello multiple times.
#'
#' @param n integer; how many times 'Hello, World!' will be printed
#'
#' @return NULL
#' @export
#'
#' @examples hello(n = 2)
#'
hello <- function(n) {
  for(i in 1:n){
    print("Hello, world!")
  }
}
