#####################
## Fruit.R         ##
## Example script  ##
#####################


# 1. Vectors ====

## 1.1 Character vector ====
# Create a character vector and call it 'Fruit'

Fruit <- c("Apples", "Bananas", "Lemons", "Berries", "Peaches", NA)

# Look at the object 'Fruit'
Fruit

# Structure of object 'Fruit'
str(Fruit)

## 1.2 Numeric vector ====
# Create a numeric vector 'Weight' 
Weight <- c(230, 191, 93, 100, 48, 244)

# Structure of object 'Weight'
str(Weight)

# Calculate mean of object 'Weight'
mean(Weight)

## 1.3 Logical vector  ====
# Create a logical vector 'Yellow' (TRUE en FALSE)
Yellow <- c(F, T, T, F, F)

# Structure oft object 'Yellow'
str(Yellow)

# Look at content of object 'Yellow'
Yellow


## 2. Data frame ====
# Create a data frame 'Fruit_data'
Fruit_data <- data.frame(Fruit, Weight, Yellow)

# Structure of 'Fruit_data'
str(Fruit_data)

## 3. Subsetting a data frame ====
# Using the $-operator
Fruit_data$Fruit

# Calculate mean of variable 'Weight' in data frame 'Fruit_data'
??

# Select specific rows and/or columns Via 'indexing' 
Fruit_data[1,1] # element in first row and first column

Fruit_data[ ,3] # all elements of third column

Fruit_data[3, ] # all elements of third row

Fruit_data[Yellow == T, ] # all elements for which 'Yellow' equals TRUE

Fruit_data[Weight > 99, ] # all elements for which 'Weight' is larger than 99
