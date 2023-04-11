
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

  f1 <- load("bird1 .Rda")
  f2 <- load("bird2 .Rda")
  f3 <- load("bird3 .Rda")
  f4 <- load("bird4 .Rda")
  f5 <- load("bird5 .Rda")
  f6 <- load("bird6 .Rda")
  f7 <- load("bird7 .Rda")
  f8 <- load("bird8 .Rda")
  f9 <- load("bird9 .Rda")
  f10 <- load("bird10 .Rda")
ADaM <- rbind(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
                f1, f2, f3, f4, f5, f6, f7, f8, f9, f10)
save(ADaM, file="ADaM.rda")
}

bom_fuze()

