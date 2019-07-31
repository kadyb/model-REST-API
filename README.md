## REST API for Iris flowers's classification model

To start the REST API service on a local host, run the `run.R` file. Four input attributes for classification are required, i.e. `Sepal.Length`, `Sepal.Width`, `Petal.Length`, `Petal.Width`. Input values must be greater than 0 and passed as a string. The type of iris is returned as json in response to the request.

The service supports logging information about incoming requests.

### Example
As an example, `Python` was used to send a request to the REST API. Check function `request` in `request.py`. It is necessary to provide the path to the csv file with data and service address as function arguments.

```python
print(request("test/request.csv", "http://localhost:5762/predict.class"))

#>  20 objects predicted in 20 s
#>  [['versicolor'], ['setosa'], ['setosa'], ['setosa'], ['virginica'], ['versicolor'], ['setosa'], ['virginica'], ['versicolor'], ['versicolor'], ['virginica'], ['virginica'], ['setosa'], ['virginica'], ['versicolor'], ['versicolor'], ['setosa'], ['versicolor'], ['versicolor'], ['virginica']]
```

It is also possible to use a simple `curl` request from Terminal.

```bash
curl --data "Sepal.Length=6&Sepal.Width=2.5&Petal.Length=4&Petal.Width=1" "localhost:5762/predict.class"

#> ["versicolor"]
```

___
### TODO:
* Move conditions such as column type and required attributes from predict code to REST API
* Return 400 Client Error in case of an error
