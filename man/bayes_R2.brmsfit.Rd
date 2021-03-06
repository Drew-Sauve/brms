% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brmsfit-methods.R
\name{bayes_R2.brmsfit}
\alias{bayes_R2.brmsfit}
\alias{bayes_R2}
\title{Compute a Bayesian version of R-squared for regression models}
\usage{
\method{bayes_R2}{brmsfit}(object, resp = NULL, summary = TRUE,
  robust = FALSE, probs = c(0.025, 0.975), ...)
}
\arguments{
\item{object}{An object of class \code{brmsfit}.}

\item{resp}{Optional names of response variables. If specified, predictions
are performed only for the specified response variables.}

\item{summary}{Should summary statistics 
 (i.e. means, sds, and 95\% intervals) be returned
instead of the raw values? Default is \code{TRUE}.}

\item{robust}{If \code{FALSE} (the default) the mean is used as 
the measure of central tendency and the standard deviation as 
the measure of variability. If \code{TRUE}, the median and the 
median absolute deviation (MAD) are applied instead.
Only used if \code{summary} is \code{TRUE}.}

\item{probs}{The percentiles to be computed by the \code{quantile} 
function. Only used if \code{summary} is \code{TRUE}.}

\item{...}{Further arguments passed to 
\code{\link[brms:fitted.brmsfit]{fitted}},
which is used in the computation of the R-squared values.}
}
\value{
If \code{summary = TRUE} a 1 x C matrix is returned
 (\code{C = length(probs) + 2}) containing summary statistics
 of Bayesian R-squared values.
 If \code{summary = FALSE} the posterior samples of the R-squared values
 are returned in a S x 1 matrix (S is the number of samples).
}
\description{
Compute a Bayesian version of R-squared for regression models
}
\details{
For an introduction to the approach, see Gelman et al. (2018)
 and \url{https://github.com/jgabry/bayes_R2/}.
}
\examples{
\dontrun{
fit <- brm(mpg ~ wt + cyl, data = mtcars)
summary(fit)
bayes_R2(fit)

# compute R2 with new data
nd <- data.frame(mpg = c(10, 20, 30), wt = c(4, 3, 2), cyl = c(8, 6, 4))
bayes_R2(fit, newdata = nd)
}

}
\references{
Andrew Gelman, Ben Goodrich, Jonah Gabry & Aki Vehtari. (2018).
  R-squared for Bayesian regression models, \emph{The American Statistician}.
  \url{https://doi.org/10.1080/00031305.2018.1549100}. (Preprint available at
  \url{https://stat.columbia.edu/~gelman/research/published/bayes_R2_v3.pdf}.)
}
