##Install Packages
install.packages("tidyverse")
install.packages("drat")

##Load drat and add epiforecasts
library(tidyverse)
library(drat)
drat:::add("epiforecasts")

##Install Covid 19 and remotes packages
install.packages("covid19.nhs.data")
install.packages("remotes")
remotes::install_github("epiforecasts/covid19.nhs.data")
library(covid19.nhs.data)

#Create admissions datasets
adm <- get_admissions("ltla")

##Create map of admissions by LTLA
map_admissions(adm, england_ltla_shape)


##Create graph for Derby data
adm %>% 
  filter(geo_name %in% "Derby") %>% 
  ggplot(aes(x = date, y = admissions)) +
  geom_col(width = 1.2, col = "blue", fill= "blue") +
  theme_minimal() +
  labs(x = "Date", y= "Daily Hospital Admissions",
       title = "Covid-19 Admissions in Derby",
       subtitle = "Estimated using a probabilistic mapping from NHS Trusts to lower-tier local authority level")


##Create Derby data
Derby <- adm %>% 
  filter(geo_name == "Derby")

##Show the most recent dates of the data and summary stats
tail(Derby)

summary(Derby)
