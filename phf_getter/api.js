const express = require('express');
const kafka = require('kafkajs');
const pg = require('pg');
var app = express();

const responses = Object.create(null);

/*
 *
 *
 *
 *	POSTGRESql CONNECTION AND INITIALIZATION!
 *
 *
 *
 */ 

//consumer and producer here

const kafka = new Kafka({
	"clientId": "SaaS-2022",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]

});

const consumer = kafka.consumer({"groupId": "phf_cons"})

console.log("Consumer Connecting.......")
consumer.connect()

console.log("Consumer Connected!")
consumer.subscribe({
	topic: "phf",
});


//producer config and connection!

const producer = kafka.producer();

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");

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
		//if the message is new data then get request to getter to get the data 
		//and on end we insert them on DB
		
		if(data["message in ascii"] === ""){

		}

		if(data["message in ascii"] === ""){
			
		}

		//.... ifs = number of cases (e.g. new data, add new country..)	
	}
});
//----------------------------------

//function to read csv's per e.g. 1min and import it to DB

const result = producer.send({
	topic: "phf",
	//replyId: replyId,
	messages: [{
		"value": "MESSAGE TO BE SENT",
		"data": [] 
		
	}]
});


//res.status(200).send(value[0]);
app.get("/getData/:country/:dataFrom/:dataTo", (req, res, next) => {
	
	/*
	 *
	 *
	 * 	CODE HERE MUST SEND TO THE DISPLAY THE DATA IN A JSON from the specified dates 
	 *	 
	 *
	 */ 

});

app.get("/newData", (req, res, next) => {
	
	/*
	 *
	 *
	 *	CODE HERE MUST SEND THE DATA THAT JUST IMPORTED TO DB 
	 *
	 */ 
});	


app.get("/getIniData/:country", (req, res, next) => {
	
	/*
	 *
	 *	CODE HERE MUST RETURN ALL THE DATA FOR THE SPECIFIC COUNTRY TILL NOW (CURRENT STATE OF DB)
	 *	(SELECT * FROM COUNTRY)	
	 *
	 */ 

});	

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8083, () => {
	console.log("Server running on port 8080");
});
