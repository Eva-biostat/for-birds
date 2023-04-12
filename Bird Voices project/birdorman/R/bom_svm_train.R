#library(tidyverse)
#library(e1071)

#' Training Support Vector Machine on analysis data model (ADaM)
#'
#' @return - graphical and accuracy output that the training was successful
#' @export
#' @import tidyverse e1071
#' @examples - bom_svm_train()
bom_svm_train <- function(){

setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/extraneous stuff/data")
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

#bom_svm_train()
