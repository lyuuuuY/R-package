\name{dijkstra}
\alias{dijkstra}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dijkstra(df, x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df}{
%%     ~~Describe \code{df} here~~
}
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or standard data sets, see data().

## The function is currently defined as
function (df, x) 
{
    nodes <- unique(c(df[, 1]))
    dist <- rep(Inf, length(nodes))
    names(dist) <- nodes
    dist[x] <- 0
    visited <- rep(FALSE, length(nodes))
    names(visited) <- nodes
    visited[x] <- TRUE
    neighbors <- subset(df, df[, 1] == x)
    for (i in 1:nrow(neighbors)) {
        dist[as.character(neighbors[i, 2])] <- neighbors[i, 3]
    }
    new_dist <- dist
    for (i in 1:(length(nodes) - 1)) {
        if (all(visited)) {
            break
        }
        new_node <- as.numeric(names(new_dist[!visited][which.min(new_dist[!visited])]))
        neighbors <- subset(df, df[, 1] == new_node)
        try_dist <- new_dist
        for (j in 1:nrow(neighbors)) {
            if ((new_dist[new_node] + neighbors[j, 3]) < new_dist[neighbors[j, 
                2]]) {
                try_dist[neighbors[j, 2]] <- new_dist[new_node] + 
                  neighbors[j, 3]
            }
        }
        new_dist <- try_dist
        visited[new_node] <- TRUE
    }
    return(new_dist)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
