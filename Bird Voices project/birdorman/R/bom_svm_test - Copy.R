library(tidyverse)
library(e1071)

bom_svm_test <- function(COCO){
# COCO is file name for what thumbprint you are testing

  setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/birdorman/data")
  load("ADaM.Rda")
  str(ADaM)

  load(paste0(COCO, ".Rda"))
  # the name of the data here is thmb

  ADaM$birdorman <- as.factor(ADaM$birdorman)

  svmfit = svm(birdorman ~ .,
               data = ADaM,
               kernel = "polynomial",
               #cost = 10,
               scale = FALSE)

  dev.off()
  par(mar=c(1,1,1,1))
  dev.new()

  # how well we did
  #table(ADaM$birdorman, predict(svmfit))

  # testing
  plot(svmfit, thmb, Amp1 ~ Amp2)
  # it would be nice to chose Amps as in bom_viz


}

bom_svm_test(COCO = "loon ")
bom_svm_test(COCO = "Eva ")
bom_svm_test(COCO = "actor1 ")
