
bom_fuze <- function(){
setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/birdorman/data")
  #bind into analysis data model (ADaM)
 load("actor1 .Rda")
  r1 <- thmb
  load("actor2 .Rda")
  r2 <- thmb
  load("actor3 .Rda")
  r3 <- thmb
  load("actor4 .Rda")
  r4 <- thmb
  load("actor5 .Rda")
  r5 <- thmb
  load("actor6 .Rda")
  r6 <- thmb
  load("actor7 .Rda")
  r7 <- thmb
  load("actor8 .Rda")
  r8 <- thmb
  load("actor9 .Rda")
  r9 <- thmb
  load("actor10 .Rda")
  r10 <- thmb

  load("bird1 .Rda")
  f1 <- thmb
  load("bird2 .Rda")
  f2 <- thmb
  load("bird3 .Rda")
  f3 <- thmb
  load("bird4 .Rda")
  f4 <- thmb
  load("bird5 .Rda")
  f5 <- thmb
  load("bird6 .Rda")
  f6 <- thmb
  load("bird7 .Rda")
  f7 <- thmb
  load("bird8 .Rda")
  f8 <- thmb
  load("bird9 .Rda")
  f9 <- thmb
  load("bird10 .Rda")
  f10 <- thmb
ADaM <- rbind(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
                f1, f2, f3, f4, f5, f6, f7, f8, f9, f10)
str(ADaM)
save(ADaM, file="ADaM.rda")
}

bom_fuze()

