model = readRDS("model-REST-API-master/model_LDA.rds")

new.data = data.frame(
   Sepal.Length = c(5, 5.9, 6.5),
   Sepal.Width = c(3.4, 2.8, 3),
   Petal.Length = c(1.5, 4.3, 5.5),
   Petal.Width = c(0.2, 1.3, 2)
)

# Checking if the model works well, should return TRUE
output = predict(model, new.data)
all(output == c("setosa", "versicolor", "virginica"))


# Randomizing of input data to be tested
set.seed(1)
index = sample(1:nrow(model$trainingData), size = 20)
test = model$trainingData[index, 2:5]
write.csv(test, "request.csv")
