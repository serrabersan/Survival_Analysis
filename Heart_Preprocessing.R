library(tidyverse)
library(psych)

data <- read.delim("heart.dat", sep=" ")

# Exploring the dimensions of our dataset  
dim(data) 

# displaying the column names  
variable_names <- names(data) 
print(variable_names) 

# See the data types of variables(column) 
str(data) 

#  Removing column X as it is an extra index column  
# data$X <- NULL

describe(data)





