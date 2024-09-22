#' Calculate the shortest path from the initial node to every node in the graph
#'
#'   The function uses Dijkstras algorithm to Calculate the shortest path from
#'   the initial node to every node in the graph.
#'   
#' @param graph A data.frame with three variables`v1`,`v2`and `w`.
#'   *`v1`:Starting node of the edge .
#'   *`V2`:Ending node of the edge .
#'   *`w`:The weight of the edge from v1 to v2.
#' @param init_node A numeric scalar that exist in the graph.
#'
#' @return new_dist A vector that shows the shortest path to every other node 
#'   from the staring point.
#'   
#' @export
#'
#' @seealso [https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm]for more 
#'   information about Dijkstras algorithm.
#'   
#' @examples
#'   wiki_graph <- data.frame(
#'   v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'   v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'   w = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#'   )
#'   shortest_paths <- dijkstra(wiki_graph, 3)
#' 
dijkstra <-
function(graph,init_node){
  if (!is.data.frame(graph)){
    stop("graph must be a data.frame") 
    } 
  if (ncol(graph) != 3) { 
    stop("graph must have 3 columns") 
  }
  if (!all(c("v1", "v2", "w") %in% names(graph))) { 
    stop("graph must have columns v1, v2, and w") 
    }
  stopifnot(is.numeric(init_node), init_node %in% graph[,1])
  nodes <- unique(c(graph[,1]))
  dist <- rep(Inf, length(nodes))
  names(dist) <- nodes
  dist[init_node] <- 0
  visited <- rep(FALSE, length(nodes))
  names(visited) <- nodes
  visited[init_node] <- TRUE
  neighbors <- subset(graph, graph[,1] == init_node)
  for (i in 1:nrow(neighbors)) {
    dist[as.character(neighbors[i,2])] <- neighbors[i,3]
  }
  new_dist <- dist
  for (i in 1:(length(nodes)-1)) {
    if (all(visited)) {
      break
    }
    new_node <- as.numeric(names(new_dist[!visited][which.min(new_dist[!visited])]))
    neighbors <- subset(graph, graph[,1] == new_node)
    try_dist <- new_dist
    for (j in 1:nrow(neighbors)) {
      if((new_dist[new_node]+neighbors[j,3])<new_dist[neighbors[j,2]]){
        try_dist[neighbors[j,2]]<- new_dist[new_node]+neighbors[j,3]
      }
    }
    new_dist <- try_dist
    visited[new_node] <- TRUE
  }
  return(as.numeric(unname(new_dist)))
}

