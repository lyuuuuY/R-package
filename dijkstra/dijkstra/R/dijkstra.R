#' Title
#'
#' @param df
#' @param x
#'
#' @return new_dist
#' @export
#'
#' @examples
#'  wiki_graph <- data.frame(
#'   v1 = c(1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6),
#'   v2 = c(2, 3, 6, 3, 4, 4, 6, 5, 6, 4, 6, 5),
#'   w = c(7, 9, 14, 10, 15, 11, 2, 6, 9, 6, 9, 2)
#' )
#'
#' # Run Dijkstra's algorithm starting from node 3
#' shortest_paths <- dijkstra(wiki_graph, 3)
dijkstra <-
function(df,x){
  nodes <- unique(c(df[,1]))
  dist <- rep(Inf, length(nodes))
  names(dist) <- nodes
  dist[x] <- 0
  visited <- rep(FALSE, length(nodes))
  names(visited) <- nodes
  visited[x] <- TRUE
  neighbors <- subset(df, df[,1] == x)
  for (i in 1:nrow(neighbors)) {
    dist[as.character(neighbors[i,2])] <- neighbors[i,3]
  }
  new_dist <- dist
  for (i in 1:(length(nodes)-1)) {
    if (all(visited)) {
      break
    }
    new_node <- as.numeric(names(new_dist[!visited][which.min(new_dist[!visited])]))
    neighbors <- subset(df, df[,1] == new_node)
    try_dist <- new_dist
    for (j in 1:nrow(neighbors)) {
      if((new_dist[new_node]+neighbors[j,3])<new_dist[neighbors[j,2]]){
        try_dist[neighbors[j,2]]<- new_dist[new_node]+neighbors[j,3]
      }
    }
    new_dist <- try_dist
    visited[new_node] <- TRUE
  }
  return(new_dist)
}
