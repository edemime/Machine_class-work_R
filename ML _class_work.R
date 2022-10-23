##############################
# Machine Learning with R    #
# Date: 23rd, October, 2022  #
# Data Science Mar. 2022 class#
###############################

# Import Libraries
# install.packages("mlbench")
library(mlbench)
Install.packages("caret")
library(caret)

# Load the Boston Housing dataset
load(Bostonhousing)
data(BostonHousing)

#visualize the data
plot(BostonHousing$crim)
hist(BostonHousing$age)

#Split the dataset using stratify random sampling
myData <- createDataPartition(BostonHousing$medv, p = 0.8, list = FALSE)
Training_Dataset <- BostonHousing[myData,]
Testing_Dataset <- BostonHousing[-myData,]

# Time to build our Linear Regressing Model
Model <- train(
  medv ~. , 
  data = Training_Dataset,
  na.action = na.omit,
  preProcess = c("scale","center"),
  method = "lm",
  trControl = trainControl(method = "none")
  
  
)

# It's time to predict using our model
Model.Training <- predict(Model, Training_Dataset)
Model.Training <- predict(Model, Testing_Dataset)

#Model summary
summary(Model)
