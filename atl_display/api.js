const express = require('express');
const kafka = require('kafkajs');
const pg = require('pg');
var app = express();

const responses = Object.create(null);

//consumer and producer here

const kafka = new Kafka({
        "clientId": "SaaS-2022",
        "brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
    
});

const consumer = kafka.consumer({"groupId": "atl_cons"})

console.log("Consumer Connecting.......")
consumer.connect()

console.log("Consumer Connected!")
consumer.subscribe({
        topic: "atl",
});


//producer config and connection!

const producer = kafka.producer();

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");





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
