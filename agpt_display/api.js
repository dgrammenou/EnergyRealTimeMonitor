const express = require('express');
const kafka = require('kafkajs');
var app = express();

//consumer and producer here

//res.status(200).send(value[0]);

app.get("/getIniData", (req, res, next) => {


}

app.get("/getNewData", (req, res, next) => {

}

app.get("/healthCheck", (req, res, next) => {
        res.status(200).send("I am healthy");
} 

var app = express();app.listen(7080, () => {
 console.log("Server running on port 3000");
});
