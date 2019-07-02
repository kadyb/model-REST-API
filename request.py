import time
import json
import requests

def request(path, service):
"""
The function sends a request to the REST API to classify irises species.
It is required to provide a csv file with data service address.
The object classes are returned as a result.
"""
    with open(path) as csvFile:
        lines = csvFile.readlines()[1:]
    csvFile.close()
    
    SepalLength = []
    SepalWidth = []
    PetalLength = []
    PetalWidth = []
    
    for line in lines:
        data = line.split(',')
        SepalLength.append(data[0])
        SepalWidth.append(data[1])
        PetalLength.append(data[2])
        PetalWidth.append(data[3])
    
    output = []
    startTime = time.time()
    for x in range(len(lines)):
        response = requests.post(
        service,
        headers = {"Content-Type": "application/json"},
        data = json.dumps({
                "Sepal.Length": SepalLength[x],
                "Sepal.Width": SepalWidth[x],
                "Petal.Length": PetalLength[x],
                "Petal.Width": PetalWidth[x]
                })
        )
        output.append(response.json())
    
    predTime = str(round(time.time() - startTime))
    print(str(len(lines)) + " objects predicted in " + predTime + " s")
    return(output)

print(request("model-REST-API-master/test/request.csv", "http://localhost:5762/predict.class"))