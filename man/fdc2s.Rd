\name{fdc2s}
\alias{fdc2s}
\title{Mass fractal dimension of a 2D cluster}
\description{
\code{fdc2s()} function uses a linear regression model for statistical estimation of the mass fractal dimension of a cluster on 2D square lattice with iso- & anisotropic sets cover.
}
\usage{
fdc2s(acc=ssi20(x=95), bnd=isc2s(k=12, x=dim(acc)))
}
\arguments{
\item{acc}{an accessibility matrix for 2D square percolation lattice.}
\item{bnd}{bounds for the iso- or anisotropic set cover.}
}
\value{
A linear regression model for statistical estimation of the mass fractal dimension of a cluster on 2D square lattice with iso- & anisotropic sets cover.
}
\details{
The mass fractal dimension for a cluster is equal to the coefficient of linear regression between \code{log(n)} and \code{log(r)}, where \code{n} is an absolute frequency of the total cluster sites which are bounded elements of iso- & anisotropic sets cover.

The isotropic set cover on 2D square lattice is formed from scalable squares with variable sizes \code{2r+1} and a fixed point in the lattice center.

The anisotropic set cover on 2D square lattice is formed from scalable rectangles with variable sizes \code{r+1} and a fixed edge along the lattice boundary.

The percolation is simulated on 2D square lattice with uniformly weighted sites and the constant parameter \code{p}.

The isotropic cluster is formed from the accessible sites connected with initial sites subset.

If \code{acc[e]<p} then \code{e} is accessible site; if \code{acc[e]==1} then \code{e} is non-accessible site; if \code{acc[e]==2} then \code{e} belong to a sites cluster.
}
\seealso{
\link{fdc3s},
\link{fds2s}, \link{fds3s}
}
\concept{square lattice}
\concept{site percolation}
\concept{isotropic set cover}
\concept{anisotropic set cover}
\concept{interval estimation}
\concept{mass fractal dimension}
\author{Pavel V. Moskalev}
\references{
Moskalev P.V., Grebennikov K.V. and Shitov V.V. (2011) Statistical estimation of percolation cluster parameters. \emph{Proceedings of Voronezh State University. Series: Systems Analysis and Information Technologies}, No.1 (January-June), pp.29-35, arXiv:1105.2334v1; in Russian.
}
\examples{
# # # # # # # # # # # # # # # # #
# Example 1: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .592746
p1 <- pc - .03
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac1 <- ssi20(x=lx, p=p1)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2)
bnd <- isc2s(k=9, x=dim(ac1))
fd1 <- fdc2s(acc=ac1, bnd=bnd)
fd2 <- fdc2s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- y <- seq(lx)
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, y, ac1, cex.main=1,
      main=paste("Isotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, y, ac2, cex.main=1,
      main=paste("Isotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n",
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n",
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))

\dontrun{
# # # # # # # # # # # # # # # # #
# Example 2: Anisotropic set cover, dir=2
# # # # # # # # # # # # # # # # #
pc <- .592746
p1 <- pc - .03
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2; ssy <- seq(lx+2, 2*lx-1)
set.seed(20120627); ac1 <- ssi20(x=lx, p=p1, set=ssy, all=FALSE)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2, set=ssy, all=FALSE)
bnd <- asc2s(k=9, x=dim(ac1), dir=2)
fd1 <- fdc2s(acc=ac1, bnd=bnd)
fd2 <- fdc2s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- y <- seq(lx)
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, y, ac1, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(v=ss, lty=2)
image(x, y, ac2, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
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
}
