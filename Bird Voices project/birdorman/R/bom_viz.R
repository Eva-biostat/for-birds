library(patchwork)
library(tidyverse)
library(ggplot2)

bom_viz <- function(A1, A2){
  setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/birdorman/data")
  load("ADaM.Rda")
  str(ADaM)

  dev.off()
  par(mar=c(1,1,1,1))
  dev.new()
  p1 <- ADaM %>%
    ggplot(aes_string(x = A1, y = A2, color = "birdorman", label = "id")) +
    geom_text() +
    scale_x_continuous(breaks=seq(-100, 0, 20)) +
    scale_y_continuous(breaks=seq(-100, 0, 20)) +
    theme_minimal()

  p2 <- ADaM %>%
    ggplot(aes_string(x = A1, y = A2, color = "birdorman")) +
    geom_point() +
    scale_x_continuous(breaks=seq(-100, 0, 20)) +
    scale_y_continuous(breaks=seq(-100, 0, 20)) +
    geom_point(color = dplyr::case_when(ADaM$id == 11 ~ "green" )) +
    #11 - this is me, hehehe
    theme_minimal()

  p1 + p2
}

bom_viz(A1 = "Amp1", A2 = "Amp2")
bom_viz(A1 = "Amp1", A2 = "Amp3")
bom_viz(A1 = "Amp5", A2 = "Amp10")
