setwd("/Users/galst/Documents/School/R/Titanic")
train <- read.csv("train.csv", stringsAsFactors=FALSE)
test <- read.csv("test.csv", stringsAsFactors=FALSE)

train$Survived <- factor(train$Survived)
set.seed(1)
fit <- train(Survived~Pclass + Sex + SibSp + Embarked + Parch + Fare, data=train,method="rf",ntree=2000)

test$Fare <- ifelse(is.na(test$Fare), mean(test$Fare, na.rm = TRUE), test$Fare)
test$Survived <- predict(fit, newdata = test)
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = "secondTry.csv", row.names = FALSE)