% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkpoint_remove.R
\name{checkpointRemove}
\alias{checkpointRemove}
\title{Remove checkpoint archive from disk.}
\usage{
checkpointRemove(snapshotDate, checkpointLocation = "~/")
}
\arguments{
\item{snapshotDate}{Date of snapshot to use in \code{YYYY-MM-DD} format,e.g. \code{"2014-09-17"}.  Specify a date on or after \code{"2014-09-17"}.  MRAN takes one snapshot per day.}

\item{checkpointLocation}{File path where the checkpoint library is stored.  Default is \code{"~/"}, i.e. the user's home directory. A use case for changing this is to create a checkpoint library on a portable drive (e.g. USB drive).}
}
\description{
Remove checkpoint archive from disk.
}
\examples{
checkpointArchives()
\dontrun{
checkpointRemove("2016-10-01")
}

}
\seealso{
checkpointArchives
}

