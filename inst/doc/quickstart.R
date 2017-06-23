## ---- echo = FALSE, message = FALSE--------------------------------------
library(cbar, warn.conflicts = F)
library(dplyr, warn.conflicts = F)
library(ggplot2, warn.conflicts = F)

## ---- eval = F-----------------------------------------------------------
#  install.packages("cbar")

## ---- eval = F-----------------------------------------------------------
#  devtools::install_github("zedoul/cbar")

## ---- eval = F-----------------------------------------------------------
#  library(cbar)

## ------------------------------------------------------------------------
library(cbar)

.data <- mtcars
rownames(.data) <- NULL
datetime <- seq(from = Sys.time(), length.out = nrow(.data), by = "mins")
.data <- cbind(datetime = datetime, .data)

ref_session <- 1:16
mea_session <- 17:nrow(.data)

.cbar <- cbar(.data, ref_session, mea_session)
plot_ts(.cbar)

## ------------------------------------------------------------------------
summarise_session(.cbar)

## ------------------------------------------------------------------------
print(.cbar)

## ------------------------------------------------------------------------
summarise_anomaly(.cbar, .session = "measurement")

