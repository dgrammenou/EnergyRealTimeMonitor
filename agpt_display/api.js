const express = require('express');
const kafka = require('kafkajs');
const pg = require('pg');
const axios = require('axios');
var app = express();
// app.use(express.json())

const getData = Object.create(null);
// const getIniData = Object.create(null);
// const getNewData = Object.create(null);

var lastDate = "" //in format YY-MM-DD

/*
 *
 *
 *
 *      POSTGRESql CONNECTION AND INITIALIZATION!
 *
 *
 *
 */

// consumer and producer here

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
		//if the message is new data then get request to getter to get the data 
		//and on end we insert them on DB
		if(data["message in ascii"] == "new data"){
			//get request (axios)
			
			
			//insertion to db


			//
		}		
	}
});
//----------------------------------


//"/api/IniData/:country/:typeOfEnergy"
// app.get("/api/IniData", (req, res, next) => {

// 	if(!req.body.data) {
// 		res.status(500).send("Invalid request format");
// 		return;
// 	} 

// 	const replyId = Math.random().toString().substr(2);
// 	getIniData[replyId] = res;
// 	console.log(req);
	

// });

//"/api/NewData/:country/:typeOfenergy"
// app.get("/api/NewData", (req, res, next) => {
	
// 	if(!req.body.data) {
// 		res.status(500).send("Invalid request format");
// 		return;
// 	} 

// 	const replyId = Math.random().toString().substr(2);
// 	if(!getNewData[[req.body.country, req.body.typeOfEnergy, req.body.date]]){
// 		getNewData[[req.body.country, req.body.typeOfEnergy, req.body.date]] = []
// 	} 
// 	getNewData[[req.body.country, req.body.typeOfEnergy, req.body.date]].push([replyIdres]);
// 	console.log(req);

// });

//"/api/Data/:date/:country/:typeOfenergy"
app.get("/api/GenerationPerType/chart", (req, res, next) => {
	
	console.log("req = ", req.query);
	if(!req.query) {
		res.status(500).send("Invalid request format");
		return;
	} 
	// check if data is <= to last data
	if(req.query.date > lastDate){
		var str = "Please send date <=" + lastDate;
		res.status(500).send();			
	}
	const replyId = Math.random().toString().substr(2);
	if(!getData[[req.query.country, req.query.generationType, req.query.date]]){
		console.log("init array for getData");
		getData[[req.query.country, req.query.generationType, req.query.date]] = [];
	} 
	getData[[req.query.country, req.query.generationType, req.query.date]].push([replyId, res]);
	console.log(getData);
	if (getData[[req.query.country, req.query.generationType, req.query.date]].length === 0){
		console.log("returning");
		return;
	}	

	else {
		//Select from db the data and on end res.status(200).send(json Data) 
		//on end also i should iterate throught the list (getData) of candidate (for the specific (country, genType, data)) clients and send them the data)
		//after that pop them from the list (getData)
	}

});

app.get("/api/healthCheck", (req, res, next) => {
        res.status(200).send("I am healthy");
}); 

app.listen(7081, () => {
 console.log("Server running on port 7081");
});
