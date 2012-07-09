\name{fds3s}
\alias{fds3s}
\title{Mass fractal dimension of sampling 3D clusters}
\description{
\code{fds3s()} function uses a linear regression model for statistical estimation of the mass fractal dimension of sampling clusters on 3D square lattice with iso- & anisotropic sets cover.
}
\usage{
fds3s(rfq=fssi30(x=95), bnd=isc3s(k=12, x=dim(rfq)))
}
\arguments{
\item{rfq}{relative sampling frequencies for sites of the percolation lattice.}
\item{bnd}{bounds for the iso- or anisotropic set cover.}
}
\value{
A linear regression model for statistical estimation of the mass fractal dimension of sampling clusters on 3D square lattice with iso- & anisotropic sets cover.
}
\details{
The mass fractal dimension for sampling clusters is equal to the coefficient of linear regression between \code{log(w)} and \code{log(r)}, where \code{w} is a relative sampling frequency of the total sites which are bounded elements of iso- & anisotropic sets cover.

The isotropic set cover on 3D square lattice is formed from scalable cubes with variable sizes \code{2r+1} and a fixed point in the lattice center.

The anisotropic set cover on 3D square lattice is formed from scalable cuboids with variable sizes \code{r+1} and a fixed face along the lattice boundary.

The percolation is simulated on 3D square lattice with uniformly weighted sites and the constant parameter \code{p}.
 
The isotropic cluster is formed from the accessible sites connected with initial sites subset.

Each element of the matrix \code{rfq} is equal to the relative frequency with which the 3D square lattice site belongs to a cluster sample.
}
\seealso{
\link{fds2s}, 
\link{fdc2s}, \link{fdc3s}
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
p1 <- pc - .01
p2 <- pc + .01
lx <- 33; ss <- (lx+1)/2
rf1 <- fssi30(n=100, x=lx, p=p1)
rf2 <- fssi30(n=100, x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(rf1))
fd1 <- fds3s(rfq=rf1, bnd=bnd)
fd2 <- fds3s(rfq=rf2, bnd=bnd)
w1 <- fd1$model[,"w"]; w2 <- fd2$model[,"w"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
ww1 <- predict(fd1, newdata=list(r=rr), interval="conf")
ww2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- rf1[,ss,]; y2 <- rf2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, zlim=c(0, 3*mean(y1)), cex.main=1,
      main=paste("Isotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, z, y2, zlim=c(0, 3*mean(y2)), cex.main=1,
      main=paste("Isotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, w1, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, ww1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, w2, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, ww2, lty=c(1,2,2), col=c("black","red","red"))

# # # # # # # # # # # # # # # # #
# Example 2: Anisotropic set cover, dir=3
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .01
p2 <- pc + .01
lx <- 33; ss <- (lx+1)/2
ssz <- seq(lx^2+lx+2, 2*lx^2-lx-1) 
rf1 <- fssi30(n=100, x=lx, p=p1, set=ssz, all=FALSE)
rf2 <- fssi30(n=100, x=lx, p=p2, set=ssz, all=FALSE)
bnd <- asc3s(k=9, x=dim(rf1), dir=3)
fd1 <- fds3s(rfq=rf1, bnd=bnd)
fd2 <- fds3s(rfq=rf2, bnd=bnd)
w1 <- fd1$model[,"w"]; w2 <- fd2$model[,"w"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
ww1 <- predict(fd1, newdata=list(r=rr), interval="conf")
ww2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- rf1[,ss,]; y2 <- rf2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, zlim=c(0, .3), cex.main=1,
      main=paste("Anisotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
image(x, z, y2, zlim=c(0, .3), cex.main=1,
      main=paste("Anisotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
plot(r1, w1, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, ww1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, w2, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, ww2, lty=c(1,2,2), col=c("black","red","red"))
}
