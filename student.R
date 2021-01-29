## Create a vector called scores to store the marks of 5 students
Scores <- c(65,68,70,70,71)
## Create a character vector called Names to store the names of the 5 students
Names <- c("Tayo", "Chance", "Seyi", "Louis", "Phil")
length(Names) #to confirm if we have 5 entries
## Create a character vector called Gender that stores the gender of the 5 students
Gender <- c("F", "M", "F", "M", "M")
length(Gender) #to confirm if we have 5 entries
## Use the data.frame function to create a data frame called stuMarks
stuMarks <- data.frame(Names, Scores, Gender)
stuMarks