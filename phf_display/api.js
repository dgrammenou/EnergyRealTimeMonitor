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

//consumer and producer here

//consumer config and connection!
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

		if(data["message in ascii"] === ""){

		}

		if(data["message in ascii"] === ""){
			
		}

		//.... ifs = number of cases (e.g. new data, add new country..)
		
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
app.get("/api/CrossBoarderFlow/chart", (req, res, next) => {
	
	console.log("req = ", req.query);
	if(!req.query) {
		res.status(500).send("Invalid request format");
		return;
	} 
	//check if date is <= to last date
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
	if(getData[[req.query.country, req.query.generationType, req.query.date]].length > 1){
		console.log("someone else will respond to this request");
		return;
	}		

	else {
		//Select from db the data and on end res.status(200).send(json Data) 
		//on end also i should iterate throught the list (getData) of candidate (for the specific (country, genType, data)) clients and send them the data)
		//after that pop them from the list (getData)
	}

});

app.get("/healthCheck", (req, res, next) => {
        res.status(200).send("I am healthy");
});

app.listen(7083, () => {
 console.log("Server running on port 7080");
});
