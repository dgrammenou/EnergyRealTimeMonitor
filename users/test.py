import requests

req = requests.get(
    "http://localhost:4020/api/users/login", params = {
        "firstname": "Thodoris",
        "lastname": "Paparrigopoulos",
        "email": "paparrigopoulosthodoris@gmail.com",
    }
)
print(req.status_code)
print(req.json())



req = requests.put(
    "http://localhost:4020/api/users/extend", params = { 
        "firstname": "Thodoris",
        "lastname": "Paparrigopoulos",
        "email": "paparrigopoulosthodoris@gmail.com", 
        "extend": 70,
    }
)
print(req.status_code)
print(req.json())