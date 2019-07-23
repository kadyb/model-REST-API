model = readRDS("model_LDA.rds")


#* @apiTitle Iris classification API
#* @apiDescription REST API for Iris flowers's classification model

#* Log information about requests
#* @filter logger
function(req) {
   cat("System time:", as.character(Sys.time()), "\n",
       "Request method:", req$REQUEST_METHOD, req$PATH_INFO, "\n",
       "HTTP user agent:", req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
   
   forward()
}

#* @param Petal.Width Petal width in cm
#* @param Petal.Length Petal length width in cm
#* @param Sepal.Width Sepal width width in cm
#* @param Sepal.Length Sepal length width in cm
#* @post /predict.class
predict.class = function(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) {
   
   new.data = list(Sepal.Length = as.numeric(Sepal.Length),
                   Sepal.Width = as.numeric(Sepal.Width),
                   Petal.Length = as.numeric(Petal.Length),
                   Petal.Width = as.numeric(Petal.Width)
                   )
   
   if(is.null(new.data)) return("No data submitted")
   if(anyNA(new.data)) return("Data can't contain NA")
   if(any(new.data < 0 | new.data == 0)) return("Values must be greater than 0")

   output = predict(model, new.data)
   return(output)
}
