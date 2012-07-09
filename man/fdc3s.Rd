\name{fdc3s}
\alias{fdc3s}
\title{Mass fractal dimension of a 3D cluster}
\description{
\code{fdc3s()} function uses a linear regression model for statistical estimation of the mass fractal dimension of a cluster on 3D square lattice with iso- & isotropic sets cover.
}
\usage{
fdc3s(acc=ssi30(x=95), bnd=isc3s(k=12, x=dim(acc)))
}
\arguments{
\item{acc}{an accessibility matrix for 3D square percolation lattice.}
\item{bnd}{bounds for the iso- or anisotropic set cover.}
}
\value{
A linear regression model for statistical estimation of the mass fractal dimension of a cluster on 3D square lattice with iso- & anisotropic sets cover.
}
\details{
The mass fractal dimension for a cluster is equal to the coefficient of linear regression between \code{log(n)} and \code{log(r)}, where \code{n} is an absolute frequency of the total cluster sites which are bounded elements of iso- & anisotropic sets cover.

The isotropic set cover on 3D square lattice is formed from scalable cubes with variable sizes \code{2r+1} and a fixed point in the lattice center.

The anisotropic set cover on 3D square lattice is formed from scalable cuboids with variable sizes \code{r+1} and a fixed face along the lattice boundary.

The percolation is simulated on 3D square lattice with uniformly weighted sites and the constant parameter \code{p}.
 
The isotropic cluster is formed from the accessible sites connected with initial sites subset.

If \code{acc[e]<p} then \code{e} is accessible site; if \code{acc[e]==1} then \code{e} is non-accessible site; if \code{acc[e]==2} then \code{e} belong to a sites cluster.
}
\seealso{
\link{fdc2s}, 
\link{fds2s}, \link{fds3s}
}
\concept{square lattice}
\concept{site percolation}
\concept{isotropic set cover}
\concept{anisotropic set cover}
\concept{interval estimation}
\concept{mass fractal dimension}
\author{Pavel V. Moskalev}
\examples{
# # # # # # # # # # # # # # # # #
# Example 1: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .02
p2 <- pc + .02
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac1 <- ssi30(x=lx, p=p1)
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(ac1))
fd1 <- fdc3s(acc=ac1, bnd=bnd)
fd2 <- fdc3s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- ac1[,ss,]; y2 <- ac2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, z, y2, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))

# # # # # # # # # # # # # # # # #
# Example 1: Anisotropic set cover, dir=3
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .02
p2 <- pc + .02
lx <- 33; ss <- (lx+1)/2
ssz <- seq(lx^2+lx+2, 2*lx^2-lx-1)
set.seed(20120627); ac1 <- ssi30(x=lx, p=p1, set=ssz, all=FALSE)
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2, set=ssz, all=FALSE)
bnd <- asc3s(k=9, x=dim(ac1), dir=3)
fd1 <- fdc3s(acc=ac1, bnd=bnd)
fd2 <- fdc3s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- ac1[,ss,]; y2 <- ac2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, cex.main=1,
      main=paste("Anisotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
image(x, z, y2, cex.main=1,
      main=paste("Anisotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))
}
