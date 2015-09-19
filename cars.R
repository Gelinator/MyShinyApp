require(AppliedPredictiveModeling)
require(caret)
require(randomForest)
data(FuelEconomy)

cars <- data.frame(rbind(cars2010,cars2011,cars2012));# rm(cars2010,cars2011,cars2012)

inTrain <- createDataPartition(cars$FE,p=.65,list=F)
train <- cars[inTrain,]
test <- cars[-inTrain,]

rf <- randomForest(FE ~ .,train,ntree=2000)
lmfit <- train(FE ~ .,train,method="lm",c("center","scale"))

summary(lm(predict(rf,test) ~ test$FE+0))
qplot(predict(rf,test) , test$FE) + geom_smooth(method="lm")
rf
lmfit

library(AppliedPredictiveModeling)
transparentTheme(trans = 0.5)

featurePlot(x = cars[, c(1:3,5:7)],
            y = cars$FE,
            plot = "pairs",
            ## Add a key at the top
            auto.key = list(columns = 5))