\name{SECP-package}
\alias{SECP-package}
\alias{SECP}
\docType{package}
\title{Statistical Estimation of Cluster Parameters (SECP)}
\description{
SECP package provides functionality for estimating parameters of site clusters on 2D & 3D square lattice with various lattice sizes, relative fractions of accessible sites (occupation probability), iso- & anisotropy, von Neumann & Moore (1,d)-neighborhoods.
}
\details{
\tabular{ll}{
Package: \tab SECP\cr
Type: \tab Package\cr
Version: \tab 0.1-4\cr
Date: \tab 2012-07-09\cr
License: \tab GPL-3\cr
LazyLoad: \tab yes\cr
}
\code{asc2s()} and \code{asc3s()} functions calculates the boundary coordinates for the anisotropic set cover on a 2D & 3D square lattice with a fixed edge & face along the lattice boundary.
\cr
\code{isc2s()} and \code{isc3s()} functions calculates the boundary coordinates for the isotropic set cover on the 2D & 3D square lattice with a fixed point in the lattice center.
\cr
\code{fdc2s()} and \code{fdc3s()} functions use a linear regression model for statistical estimation of the mass fractal dimension of a site cluster on 2D & 3D square lattice.
\cr
\code{fds2s()} and \code{fds3s()} functions use a linear regression model for statistical estimation of the mass fractal dimension of sampling clusters on 2D & 3D square lattice.
}
\author{Pavel V. Moskalev <moskalefff@gmail.com>}
\references{
Moskalev, P.V., Grebennikov, K.V. and Shitov, V.V. (2011),
Statistical estimation of percolation cluster parameters.
\emph{Proceedings of Voronezh State University. Series: Systems Analysis and Information Technologies}, No.1 (January-June), pp.29-35; arXiv:1105.2334v1 [cond-mat.stat-mech]; in Russian.
}