library(tidyverse)
library(labelled)

# data used: provant.RData (in folder STAT A)

transition_data <-
  provant %>%
  select(ID_School = "Schoolcode", 
         ID_Class = "Klas", 
         ID_Student = "Leerlingnummer", 
         Educ_level = "Onderwijsvorm", 
         Gender = "Geslacht",
         SES_language = "Aantikker_taal",
         SES_neighbourhood = "Aantikker_buurt",
         SES_educ_level = "Aantikker_opleidingsniveau",
         IQ_score = "IQ_volledig",
         Math_score = "VS_1",
         Reading_score = "BL_1",
         Autonomous_motivation = "Mot_WilMM1Correct",
         Controlled_motivation = "Mot_MoetMM1Correct",
         Amotivation = "Mot_DemotMM1Correct") %>%
  finalfit::remove_labels() %>%
  mutate(Educ_level2 = case_when(Educ_level == "ASO" ~ 1,
                                 Educ_level == "TSO" ~ 2,
                                 Educ_level == "BSO" ~ 3,
                                 Educ_level == "KSO" ~ 4),
         Gender2 = ifelse(Gender == "man", yes = 1, no = 0),
         SES_language2 = ifelse(SES_language == "tikt aan", yes = 1, no = 0),
         SES_neighbourhood2 = ifelse(SES_neighbourhood == "tikt aan", yes = 1, no = 0),
         SES_educ_level2 = ifelse(SES_educ_level == "tikt aan", yes = 1, no = 0),
         Autonomous_motivation = ifelse(is.na(Autonomous_motivation), 
                                        yes = 99, no = Autonomous_motivation),
         Controlled_motivation = ifelse(is.na(Controlled_motivation), 
                                        yes = 99, no = Controlled_motivation),
         Amotivation = ifelse(is.na(Amotivation), yes = 99, no = Amotivation)) %>%
  mutate_at(vars(contains("score")), as.character) 

table(transition_data$Educ_level, transition_data$Educ_level2)
table(transition_data$Gender, transition_data$Gender2)
table(transition_data$SES_language, transition_data$SES_language2)
table(transition_data$SES_neighbourhood, transition_data$SES_neighbourhood2)
table(transition_data$SES_educ_level, transition_data$SES_educ_level2)

transition_data <- transition_data %>%
  select(ID_School, 
         ID_Class, 
         ID_Student, 
         Educ_level = "Educ_level2", 
         Gender = "Gender2",
         SES_language = "SES_language2",
         SES_neighbourhood = "SES_neighbourhood2",
         SES_educ_level = "SES_educ_level2",
         IQ_score,
         Math_score,
         Reading_score,
         Autonomous_motivation,
         Controlled_motivation,
         Amotivation)

write.csv(transition_data, file = "Data/transition_data.csv")
