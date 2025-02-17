# Author : Caglayan Bal
# Date : July 31, 2022
# About : This piece of code will create the 1980 economic variable data 
## (census tract) for policy scan based on the 1980 decennial census 
## on 2010 geographies.

# Libraries
library(sf)
library(tidyverse)
library(dplyr)

# Economic Variables from Social Explorer (SE) Tables

## Unemployment Rate for Civilian Population

## Variables from SE:T41: Unemployment Rate For Civilian Population
# 1. labor   SE_T041_001   Civilian Population In Labor Force 16 Years And Over 
#                          (Estimate)
# 2. Unemp   SE_T041_003   Unemployed (Estimate)

## Poverty Status

## Variables from SE:T82: Poverty Status In 1979 (short version)
# 1. totPopE   SE_T082_001   Population for Whom Poverty Status is Determined 
#                            (Estimate)
# 2. pov       SE_T083_003   Below Poverty Level (Estimate)


# Read the data

tractEcon80 <- read_csv("~/Desktop/Task 2/1980/EconomicVar_DC_1980_Tract.csv") %>%
  dplyr::select(Geo_QName, Geo_FIPS, SE_T041_001, SE_T041_003, SE_T082_001,
                SE_T082_003)
                

# Rename the columns

colnames(tractEcon80) = c("NAME", "FIPS", "labor", "Unemp", "totPopE", "pov")
                          

# Create a column for year

tractEcon80$year = c(1980)

head(tractEcon80)


# Percentages

tractEcon80P <- tractEcon80 %>%
  dplyr::mutate(UnempP = round(Unemp/labor*100, 2), povP = round(pov/totPopE*100, 2)) %>%
                  select('NAME', 'FIPS', 'year', 'povP', 'UnempP') 
 
head(tractEcon80P)

# Save the data

write.csv(tractEcon80P, "~/Desktop/EC03_T_1980_DC.csv")
