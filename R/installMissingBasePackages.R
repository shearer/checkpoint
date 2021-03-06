checkpointBasePkgs <- function(checkpointLocation){
  checkpointPath(checkpointLocation = checkpointLocation, type = "base")
}

basePkgLocations <- function(lib = .Library){
  pkgFolder <- function(x) dirname(normalizePath(base::system.file(package=x, lib.loc=lib)))
  bp <- installed.packages(priority="base", lib.loc = lib)[, "Package"]
  locations <- vapply(bp, pkgFolder, FUN.VALUE = character(1))
  w <- locations != pkgFolder("base")
  w["compiler"] <- TRUE # Ensure compiler is always copied
  locations[w]
}

installCompiler <- function(libpath){
  pkg <- "checkpoint"
  to.dir <- file.path(libpath, pkg)
  compiler.path <- system.file(package = pkg, lib.loc = .Library)
  dir.create(to.dir, showWarnings = FALSE, recursive = TRUE)
  file.copy(to = to.dir, from = compiler.path, recursive = TRUE)
}

installMissingBasePackages <- function(checkpointLocation){
  missingBase <- basePkgLocations()
  if(length(missingBase)){
    for(i in seq_along(missingBase)){
      pkg <- missingBase[i]
      to.dir <- file.path(checkpointBasePkgs(checkpointLocation), names(pkg))
      dir.create(to.dir, showWarnings = FALSE, recursive = TRUE)
      file.copy(
        to = checkpointBasePkgs(checkpointLocation),
        from = file.path(unname(pkg), names(pkg)), recursive = TRUE)
    }
  }
}
