bikes=read.csv("hour.csv")
library(dplyr)
library(caret)
library(MASS)

bikes$weekday <- as.factor(bikes$weekday)
bikes$season <- as.factor(bikes$season)
bikes$weathersit <- as.factor(bikes$weathersit)

### Removing 2012-10-30 because of hurricane Sandy which resulted in an unusual number of bike rentals

bikes[,"dteday"] <- as.Date(bikes[,"dteday"])

bikes2 <- dplyr::filter(bikes, dteday != "2012-10-30")

### Keeping only the variables of interest

bikes2 <- dplyr::select(bikes2, -yr, -casual, -registered, -mnth, -atemp)

### Sampling 80% unique dates to create the train and test data set

set.seed(8062016)

sample_days <- sample(unique(bikes2$dteday), length(unique(bikes2$dteday))*0.8, replace = FALSE)

bikes2$intrain <- ifelse(bikes2$dteday %in% sample_days,1,0)

bikes_train <- dplyr::filter(bikes2, intrain == 1)
bikes_test <- dplyr::filter(bikes2, intrain == 0)

bikes_train <- dplyr::select(bikes_train, -dteday, -intrain)
bikes_test <- dplyr::select(bikes_test, -dteday, -intrain)


train_model = glm.nb(cnt~ season * hr + I(hr^2)  + I(hr^3) + holiday + weathersit + temp + I(temp^2) + hum + I(hum^2) + windspeed + I(windspeed^2), data=bikes_train[,-1], link = log)
# summary(train_model)
# 
# par(mfrow = c(2,2))
# plot(train_model)
# 
# fitted <- predict(train_model, new_data = bikes_train, type = 'response')
# train_RMSE <- sqrt(sum((fitted - bikes_train$cnt)^2) / (nrow(bikes_train) - 21))
# 
# test_model <- predict(train_model, newdata = bikes_test ,type = 'response')
# 
# test_RMSE <- RMSE(test_model, bikes_test$cnt)

