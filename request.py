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
    lines = [line[:-1].split(',') for line in lines]
    SepalLength, SepalWidth, PetalLength, PetalWidth = zip(*lines)
    
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
    
    print("{} objects predicted in {} s".format(
            len(lines),
            round(time.time() - startTime)
    ))
    return(output)
