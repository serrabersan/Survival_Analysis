#coverting the blank spaces into NA 
# columns <- colnames(data) 
# for (column in columns) { 
#   data[[column]] <- ifelse(trimws(data[[column]]) == "",  
#                            NA, data[[column]]) 
# } 

# Seeing missing values  
colSums(is.na(data)) 

# unique_values in categorical clumns 
unique_values <- unique(data$a7) 
unique_values 

# Calculate the frequency count for each category for imputation
frequency <- table(data$a7) 
# Find the category with the highest count (mode) #nominal columns
mode <- names(frequency)[which.max(frequency)] 
# Print the mode 
print(mode) 
# filling missing values in a7
data$a7[is.na(data$a7)] <- mode 

# Calculate the median of the a1 column #numeric columns
median_value <- median(data$a1,  
                       na.rm = TRUE) 
# filling missing values 
data$a1 <- ifelse(is.na(data$a1), 
                  median_value, data$a1)


column <- c("a2", "a6", "a9") #binary valued columns 

for(column in column){ 
  # Here we are going to calculate frequencies 
  # of 'yes' and 'no' 
  frequency <- table(data$column) 
  
  # Finding the most common category 
  most_common <- names(frequency)[which.max(frequency)] 
  
  # Filling the missing values with the 
  # most common category (or Mode) 
  data$column[is.na(data$column)] <- most_common 
}

# Seeing missing values  
sum(colSums(is.na(data)))