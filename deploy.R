model = readRDS("model_LDA.rds")


#* @apiTitle Iris classification API
#* @apiDescription REST API for Iris flowers's classification model 
#* @post /predict
predict.class = function(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) {
   new.data = data.frame(Sepal.Length = Sepal.Length,
                         Sepal.Width = Sepal.Width,
                         Petal.Length = Petal.Length,
                         Petal.Width = Petal.Width)
   output = predict(model, new.data)
   return(output)
}
