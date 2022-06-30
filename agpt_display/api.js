const express = require('express');
const kafka = require('kafkajs');
const pg = require('pg');
var app = express();

const responses = Object.create(null);

/*
 *
 *
 *
 *      POSTGRESql CONNECTION AND INITIALIZATION!
 *
 *
 *
 */

//consumer and producer here

const kafka = new Kafka({
        "clientId": "SaaS-2022",
        "brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
    
});

const consumer = kafka.consumer({"groupId": "agpt_cons"})

console.log("Consumer Connecting.......")
consumer.connect()

console.log("Consumer Connected!")
consumer.subscribe({
        topic: "agpt",
});


//producer config and connection!

const producer = kafka.producer();

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");

//res.status(200).send(value[0]);

//consumer code
//----------------------------------
consumer.run({
	//console.log("In consumer run\n")
	eachMessage: ({ topic, partition, message }) => /*res.send({ "topic":topic, "partiotion":partition, "message":message })}*/ {
		//heartbeat();
		console.log('Received message', {
			topic,
			partition,
			//key: message.key.toString(),
			value: message.value.toString()
		});
		data = {
			"topic": topic,
			//"message": rq.params.message,
			"partition": parseInt(partition),
			"message in ascii": message.value.toString()
		};
		
	}
});
//----------------------------------



app.get("/getIniData", (req, res, next) => {


});

app.get("/getNewData", (req, res, next) => {

});

app.get("/healthCheck", (req, res, next) => {
        res.status(200).send("I am healthy");
}); 

app.listen(7081, () => {
 console.log("Server running on port 7081");
});
