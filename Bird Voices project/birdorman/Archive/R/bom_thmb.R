library(tuneR)
library(seewave) # for spectro
library(reshape2)
library(dplyr)
library(purrr)

bom_thmb <- function(ANGEL, COCO, ID){
  # angel - bird or man?
  # coco - filename
  # id - id number

  setwd("C:/Users/eva/OneDrive/Desktop/local birdorman/birdorman/data")
  wav <- readWave(paste0(COCO, ".wav")) #HERE

  #wav

  # duration of the .wav file in time of seconds
  dur <- duration(wav)

  #dur

  # spectrograph
  # gives three measurements: Time, Frequency, Amplitude

  # needs large margins, even better - new window
  dev.off()
  par(mar=c(1,1,1,1))
  dev.new()
  ss = spectro(wav)

  dev.print( device = jpeg,                     # what are we printing to?
             filename = paste0(COCO, ".jpeg"),  # name of the image file
             width = 1000,                       # how many pixels wide should it be
             height = 600                       # how many pixels high should it be
             )


  # Pull all three measurements from spectro graph
  # melt() converts wide format into long format

  # For amplitude, replace Var1 and Var 2 with new variables
  amp = melt(ss$amp, value.name = "Amplitude") %>%
    select(FrequencyIndex = Var1, TimeIndex = Var2, Amplitude)

  #amp

  # For frequency, add matching row num and change value of frequency
  # Frequency value from kHz to Hz
  frequent = melt(ss$freq, value.name = "Frequency") %>%
    mutate(FrequencyIndex = row_number(), Frequency = Frequency * 1000)

  # For time, add a TimeIndex for left join later on
  tm = melt(ss$time, value.name = "Time") %>%
    mutate(TimeIndex = row_number())

  # left join all datasets together
  # Only need Time, Frequency, and Amplitude
  numeric_data <- amp %>%
    left_join(frequent, by = "FrequencyIndex") %>%
    left_join(tm, by = "TimeIndex") %>%
    select(FrequencyIndex,Time, Frequency, Amplitude) %>%
    filter(Time >= 1) %>% # shed first second of data
    filter(Time <= (dur - 1)) # shed last second of data

  #View(numeric_data, title="Numeric Data")
  # 30,976 rows

  # Get the sample of data by dividing the number of rows by
  # 10 We don't need tons of columns, just 10
  segment <- trunc(nrow(numeric_data) / 10) #SLICE = 10
  # print(segment)
  # 3,097 rows

  # Randomly sample from 10 equi sections
  rows <- rows <- sapply(1:segment, FUN = function(multiple) {
    numeric_data[round(sample(((multiple - 1) * segment + 1):(segment*multiple), size=1)),]
  })

  # We only want the amplitude, which is in row 4 of all columns
  row <- data.frame(rows[4,])

  # Give this row meaningful column names so they will match
  # the dataframe we will bind this row to in FileParser.R
  colnames(row) <- colnames(row, do.NULL = FALSE, prefix = "Amp")

  # Take slices of equal length
  # SLICE = 10
  dataToReturn <- sapply(1:10, FUN = function(multiple) {
    numeric_data[((multiple - 1) * segment + 1):(segment*multiple),]
  })

  colnames_generator <- function(prefix, range) {
    sapply(range, function(index) {
      paste(prefix, index, sep="") # concat the two values together with nothing separating
    })
  }

  # Only take amplitude, row 4
  dataToReturn <- data.frame(dataToReturn[4,])

  # concatenates the two values together with nothing separating
  colnames_generator <- function(prefix, range) {
    sapply(range, function(index) {
      paste(prefix, index, sep="")
    })
  }
  column_names <- colnames_generator("Amp", 1:ncol(dataToReturn))
  colnames(dataToReturn) <- column_names

  #View(dataToReturn, title = "Wave Return")

  # keep first five rows
  # call it actor, id = 1
  # save as actor1.data

  row5  <- dataToReturn[1:5, ]
  #View(row5)

  # Add multiple columns to dataframe
  birdorman = ANGEL
  id = c(ID) #HERE
  thmb <- cbind(row5, birdorman, id)

  View(thmb) #HERE
  save(thmb,COCO, file=paste(COCO,".Rda"))
}

bom_thmb(ANGEL = "man", COCO = "actor1", ID = 1)
bom_thmb(ANGEL = "man", COCO = "actor2", ID = 2)
bom_thmb(ANGEL = "man", COCO = "actor3", ID = 3)
bom_thmb(ANGEL = "man", COCO = "actor4", ID = 4)
bom_thmb(ANGEL = "man", COCO = "actor5", ID = 5)
bom_thmb(ANGEL = "man", COCO = "actor6", ID = 6)
bom_thmb(ANGEL = "man", COCO = "actor7", ID = 7)
bom_thmb(ANGEL = "man", COCO = "actor8", ID = 8)
bom_thmb(ANGEL = "man", COCO = "actor9", ID = 9)
bom_thmb(ANGEL = "man", COCO = "actor10", ID = 10)
bom_thmb(ANGEL = "man", COCO = "Eva", ID = 11)

thumb(ANGEL = "bird", COCO = "bird1", ID = 1)
thumb(ANGEL = "bird", COCO = "bird2", ID = 2)
thumb(ANGEL = "bird", COCO = "bird3", ID = 3)
thumb(ANGEL = "bird", COCO = "bird4", ID = 4)
thumb(ANGEL = "bird", COCO = "bird5", ID = 5)
thumb(ANGEL = "bird", COCO = "bird6", ID = 6)
thumb(ANGEL = "bird", COCO = "bird7", ID = 7)
thumb(ANGEL = "bird", COCO = "bird8", ID = 8)
thumb(ANGEL = "bird", COCO = "bird9", ID = 9)
thumb(ANGEL = "bird", COCO = "bird10", ID = 10)
#thumb(ANGEL = "bird", COCO = "Eva's toy cardinal", ID = 11)

