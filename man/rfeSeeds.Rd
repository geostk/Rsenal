% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rfeSeeds.R
\name{rfeSeeds}
\alias{rfeSeeds}
\title{create a list of seeds for rfeControl()}
\usage{
rfeSeeds(sizes, number, seed = 357)
}
\arguments{
\item{sizes}{the sizes of the feature selection iterations}

\item{number}{the number of boot-starpping/cv repeats}

\item{seed}{the global seed to be set}
}
\value{
a list of integer seeds
}
\description{
this function creates a list of seeds to be used with \code{\link[caret]{rfeControl}}
}
\examples{
rfeSeeds(1:9, 3)

}
\author{
Tim Appelhans (largely taken from the examples of \code{\link[caret]{rfeControl}})
}
