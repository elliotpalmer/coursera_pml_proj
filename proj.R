#Practical Machine Learning Project

#Data Site: http://groupware.les.inf.puc-rio.br/har

setwd("../data")

#Necessary Package
  library(caret)
  library(ggplot2)
  library(randomForest)
  library(plyr)
  library(e1071)

#import data
  train_data <- read.csv("train.csv", header = T, sep = ",")
  test_data <- read.csv("test.csv", header = T, sep = ",")

#Clean Data
  source('~/GitHub/pml_proj/clean_na_cols.R')
#Source Data Writing Function
  source('~/GitHub/pml_proj/pml_write_files.R')
  
#Remove the columns with mostly NAs
    clean_train <- clean_na_cols(train_data)
    clean_test <- clean_na_cols(test_data)
  #Remove columns first 7 columns
    clean_train <- clean_train[,-(1:7)]
    clean_test <- clean_test[,-(1:7)]

inTrain <- createDataPartition(clean_train$classe, p = .3, list = F)

training <- clean_train[inTrain,]
testing <- clean_train[-inTrain,]

#RandomForest Model
  model <- train(classe ~ ., data = training, preProcess = c("center","scale"), method = "rf" )

#Gradient Boosted Model
# model <- train(classe ~ ., data = training, preProcess = c("center","scale"), method = "gbm" )
#Support Vector Machine
# model <- train(classe ~ ., data = training, preProcess = c("center","scale"), method = "svm" )

#Cross Validation
  validation <- predict(model, newdata = testing)
  confusionMatrix(testing$classe, validation)

#output results
  test_set <- predict(model, newdata = clean_test)
  pml_write_files(test_set)


