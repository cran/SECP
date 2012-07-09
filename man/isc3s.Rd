\name{isc3s}
\alias{isc3s}
\title{Isotropic set cover on the 3D square lattice}
\description{
\code{isc3s()} function calculates the boundary coordinates for the isotropic set cover on the 3D square lattice with a fixed point in the lattice center.
}
\usage{
isc3s(k=12, x=rep(95, times=3), o=(x+1)/2, r=min(o-2)^(seq(k)/k))
}
\arguments{
\item{k}{a maximal set cover size: \code{k>2}.}
\item{x}{a vector of lattice sizes: \code{all(x>5)}.}
\item{o}{a fixed point of set cover elements: \code{all((0<o)&(o<x))}.}
\item{r}{a variable radius of set cover elements: \code{all((0<r)&(r<x))}.}
}
\value{
A list of boundary coordinates and sizes for the isotropic set cover on a 3D square lattice with a fixed point in the lattice center.
}
\details{
The percolation is simulated on 3D square lattice with uniformly weighted sites and the constant parameter \code{p}.
 
The percolation cluster is formed from the accessible sites connected with initial sites subset.

If an initial cluster subset in the lattice center, to estimate the mass fractal dimension requires an isotropic set cover with a fixed point in the lattice center.

The isotropic set cover on 3D square lattice is formed from scalable cubes with variable sizes \code{2r+1} and a fixed point in the lattice center.
}
\seealso{
\link{fdc2s}, 
\link{fds2s}, \link{fds3s}
}
\concept{square lattice}
\concept{site percolation}
\concept{isotropic set cover}
\concept{interval estimation}
\concept{mass fractal dimension}
\author{Pavel V. Moskalev}
\examples{
# # # # # # # # # # # # # # # # #
# Example: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .311608
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(ac2))
x <- z <- seq(lx); y2 <- ac2[,ss,]
image(x, z, y2, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster of sites in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
}
