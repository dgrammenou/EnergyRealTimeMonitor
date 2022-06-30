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



//function to read csv's per e.g. 1min and import it to DB

//var array = [CSV array]

//counter to read each time the next csv
counter = 0;


var importCSVtoDB = () => {

	setInterval(() => {
		//complete this function to read csv and import it to DB
		console.log("inside function");
		//increment counter to read next csv
		counter += 1;
		//read next csv
		console.log("inside function counter = ", counter)
		//import it to DB
		

		//update display to get the data on end of import to DB
		//the code bellow should be inside of end of import to DB
		//------------------------------------------------------
		const result = producer.send({
			topic: "phf",
			//replyId: replyId,
			messages: [{
				"value": "MESSAGE TO BE SENT",
				"data": [] 
				
			}]
		});
		console.log("after sent message with result:", result);
		//------------------------------------------------------

	}, 3000);

}

importCSVtoDB();


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

app.listen(8080, () => {
	console.log("Server running on port 8080");
});
