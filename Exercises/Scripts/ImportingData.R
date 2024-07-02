
library(here)

# Importing an excel-file

# I need the package readxl

library(readxl)

Raw_Data <- read_excel(
  path = "Data/RIASEC.xlsx"
)

# Importing an SPSS file
library(here)
library(foreign)

Raw_Friends <- read.spss(
  file = here("Data", "Friends.sav"),
  use.value.labels = FALSE,
  to.data.frame = TRUE
)


Transition_data <- read.table(
  file = here("Data", "transition_data.csv"),
  header = TRUE,
  sep = ",", 
  dec = "."
)


