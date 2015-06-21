#Practical Machine Learning Project

#Data Site: http://groupware.les.inf.puc-rio.br/har

setwd("./data")

#import data
train_data <- read.csv("train.csv", header = T, sep = ",")
test_data <- read.csv("test.csv", header = T, sep = ",")

#Clean Data
source('~/GitHub/pml_proj/clean_na_cols.R')
#Remove the columns with mostly NAs
clean_train <- clean_na_cols(train_data)
#Remove columns first 7 columns
clean_train <- clean_train[,-(1:7)]

#get new window lines


library(caret)
library(ggplot2)
library(randomForest)
library(plyr)

inTrain <- createDataPartition(clean_train$classe, p = .6, list = F)

train <- clean_train[inTrain,]
test <- trn_nw[-inTrain,]

model <- 
