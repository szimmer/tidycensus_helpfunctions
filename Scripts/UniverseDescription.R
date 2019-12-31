# This script makes a tibble describing the universe of ACS tables

library(tidyverse)

UniverseDescription <- function(dataset, year){
# One of "acs1" or "acs5"  
  if (dataset=="acs5"){
    fp <- glue::glue("https://www2.census.gov/programs-surveys/acs/summary_file/{year}/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt?#")
  } else if (dataset=="acs1"){
    fp <- glue::glue("https://www2.census.gov/programs-surveys/acs/summary_file/{year}/documentation/user_tools/ACS_1yr_Seq_Table_Number_Lookup.txt?#")
  } else{
    stop("Expecting 'acs1' or 'acs5' for dataset")
  }
  
  read_csv(fp) %>%
    filter(str_detect(`Table Title`, "Universe:")) %>%
    select(TableID=`Table ID`,TableTitle= `Table Title`) %>%
    distinct(TableID, TableTitle) %>%
    mutate(Universe=str_sub(TableTitle, 12)) %>%
    select(-TableTitle)
  
  
}

uni1 <- UniverseDescription("acs1")
uni5 <- UniverseDescription("acs5")
