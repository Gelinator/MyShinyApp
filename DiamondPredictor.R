data(diamonds)

library(caret)
library(randomForest)
inTrain <- createDataPartition(diamonds$price,p=.1,list=F)
training <- diamonds[inTrain,]
testing <- diamonds[-inTrain,]

SVMl <- train(price ~ ., training,method="svmLinear",c("center","scale")) #75%
qplot(predict(SVMl,testing)[predict(SVMl,testing)>0],testing$price[predict(SVMl,testing)>0]) + geom_smooth(method="lm")

SVMr <- train(price ~ ., training,method="svmRadial",c("center","scale")) #81%
qplot(predict(SVMr,testing)[predict(SVMr,testing)>0],testing$price[predict(SVMr,testing)>0]) + geom_smooth(method="lm")

gbm <- train(price ~ ., training,method="gbm",c("center","scale")) #82-85%
qplot(predict(gbm,testing)[predict(gbm,testing)>0],testing$price[predict(gbm,testing)>0]) + geom_smooth(method="lm")

rf <- randomForest(price ~ ., training,ntree=100) #81%
qplot(predict(rf,testing)[predict(rf,testing)>0],testing$price[predict(rf,testing)>0]) + geom_smooth(method="lm")

lasso <- train(price ~ ., training,method="lasso",c("center","scale")) #75%
qplot(predict(lasso,testing)[predict(lasso,testing)>0],testing$price[predict(lasso,testing)>0]) + geom_smooth(method="lm")

rfcaret <- train(price ~ ., training,method="rf",c("center","scale")) #80%
confusionMatrix(predict(rfcaret,testing),testing$price)
