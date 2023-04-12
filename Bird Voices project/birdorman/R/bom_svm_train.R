library(tidyverse)
library(e1071)

bom_svm_train <- function(){

setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/birdorman/data")
load("ADaM.Rda")
str(ADaM)

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
table(ADaM$birdorman, predict(svmfit))

plot(svmfit, ADaM, Amp1 ~ Amp2)
# it would be nice to chose Amps as in bom_viz

# how well we did
table(ADaM$birdorman, predict(svmfit))

plot(svmfit, ADaM, Amp1~Amp2)

predictions <- predict(svmfit, ADaM)

# Calculate the confusion matrix
confusion_matrix <- table(Predicted = predictions, Actual = ADaM$birdorman)

confusion_matrix

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy:", accuracy)

print(svmfit)

}

bom_svm_train()
