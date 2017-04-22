setwd("/Users/galst/Documents/School/R/Titanic")
train <- read.csv("train.csv", stringsAsFactors=FALSE)
test <- read.csv("test.csv", stringsAsFactors=FALSE)

test $Survived <- 0
test $Child[test $Age<18] <- 1


test $Survived[test $Sex == 'female'] <- 1
test $Survived[test $Sex == 'female' & test $Pclass == 3 & test $Fare >= 20] <- 0




predict<-data.frame(test $PassengerId, test $Survived)
names(predict)<-c("PassengerId","Survived")
rownames(predict)<-NULL
write.csv(predict, file = "zeroTry.csv", row.names = FALSE)

