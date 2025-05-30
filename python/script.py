import requests
import json
import subprocess
#from PIL import Image


subprocess.run(["figlet", "nekofetch"])

## init url

baseURL = "https://api.nekosia.cat/api/v1/images/catgirl"
result = requests.get(baseURL)

## write from json and read from it

with open('request.json', 'wb') as file:
    file.write(result.content)

with open('request.json', 'r') as file:
    result = json.load(file)

string = result['image']
string = string['original']

#print(string['url']) ## debug tool

output = requests.get(string['url'])

if output.status_code == 200:
    print("image grabbed") # debug
    with open('output.jpg', 'wb') as file :
        file.write(output.content)

subprocess.run(["kitten", "icat", "--use-window-size", "10,10,480,300", "output.jpg"])


## PIL implementation

#print("displaying image")
#image = Image.open('output.jpg')
#image.show()
