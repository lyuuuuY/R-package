anRpackage
================

# Introduction

This package provides two primary functions:

1.  `euclidean()`: A function that implements the Euclidean algorithm to
    find the greatest common divisor (GCD) of two integers.
2.  `dijkstra()`: A function that uses Dijkstra’s algorithm to compute
    the shortest paths from a source node to all other nodes in a given
    graph.

This document provides instructions on how to install and use these
functions.

# anRpackage

<!-- badges: start -->

[![R-CMD-check](https://github.com/lyuuuuY/R-package/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lyuuuuY/R-package/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of anRpackage is to find the greatest common divisor of two
numbers and the shortest path in the graph by using euclidean and
dijkstra algorithms.

## Installation

You can install the development version of anRpackage from
[GitHub](https://github.com/lyuuuuY/R-package.git/) with:

``` r
# install.packages("anRpackage")
devtools::install_github("lyuuuuY/R-package")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(anRpackage)
euclidean(123612,13892347912)
wiki_graph <- data.frame(
v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
w = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
   )
dijkstra(wiki_graph, 3)
```

## Name_Githubusername_Liuid

YanjieLyu_lyuuuuY_yanly639

YiYang_YiYang-09_yiyan338


