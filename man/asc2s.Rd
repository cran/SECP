\name{asc2s}
\alias{asc2s}
\title{Anisotropic set cover on the 2D square lattice}
\description{
\code{asc2s()} function calculates the boundary coordinates for the anisotropic set cover on the 2D square lattice with a fixed edge along the lattice boundary.
}
\usage{
asc2s(k=12, x=rep(95, times=2), dir=2, r=(x[dir]-3)^(seq(k)/k))
}
\arguments{
\item{k}{a maximal set cover size: \code{k>2}.}
\item{x}{a vector of lattice sizes: \code{all(x>5)}.}
\item{dir}{a variable component index: x) \code{dir=1}; y) \code{dir=2}; z) \code{dir=3}.}
\item{r}{a variable lenght of set cover elements: \code{all((0<r)&(r<x))}.}
}
\value{
A list of boundary coordinates and sizes for the anisotropic set cover on a 2D square lattice with a fixed edge along the lattice boundary.
}
\details{
The percolation is simulated on 2D square lattice with uniformly weighted sites and the constant parameter \code{p}.
 
The percolation cluster is formed from the accessible sites connected with initial sites subset.

If an initial cluster subset in the lattice center, to estimate the mass fractal dimension requires an anisotropic set cover with a fixed edge along the lattice boundary.

The anisotropic set cover on 2D square lattice is formed from scalable rectangles with a variable length \code{r+1} and a fixed edge along the lattice boundary.
}
\seealso{
\link{fdc3s}, 
\link{fds2s}, \link{fds3s}
}
\concept{square lattice}
\concept{site percolation}
\concept{anisotropic set cover}
\concept{interval estimation}
\concept{mass fractal dimension}
\author{Pavel V. Moskalev}
\examples{
# # # # # # # # # # # # # # # # #
# Example: Anisotropic set cover, dir=2
# # # # # # # # # # # # # # # # #
pc <- .592746
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2; ssy <- seq(lx+2, 2*lx-1)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2, set=ssy, all=FALSE)
bnd <- asc2s(k=9, x=dim(ac2), dir=2)
x <- y <- seq(lx)
image(x, y, ac2, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(v=ss, lty=2)
}
