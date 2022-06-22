var {Kafka} = require('kafkajs');
//var {express} = require('express');
const http = require('http');
const axios = require('axios')
const { exec } = require('child_process');
const shell = require('shelljs');


var statuss = 0;

console.log("before http request")
console.log("request is = http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094") 
//http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094
axios.get('http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094').then((response) => {
	console.log('inside promise')
	statuss = response.status;
	console.log(statuss)
	if (statuss == 200){ 
		try {
			shell.exec('node kafka_new.js ', (err, stdout, stderr) => {
				if (err) {
					//some err occurred
					console.error(err)
					return;
				}
			})
		}
		catch(e){
			console.log("An error occured while trying to execute kafka_new.js\n")
			console.log("Error = " + e)
		}	
	} else {
		console.log("unexpected status = " + String(status) + ", please try again\n")
		return;
	}	
	
}, (error) => {
	statuss = 600
	console.error("Error: " + error);
	return;
});

//var i = 0

/*
while(statuss == 0){
	//console.log("still alive")
}	
if (statuss == 600){
	console.log("HTTP request failed");
	return;
}	
if (statuss == 500) {
	console.log("some broker down");
	return;	
}	


console.log("status code = " + statuss + ", all brokers alive"); 
//setTimeout(() => {console.log("This is the first function")}, 10000);

const kafka1 = new Kafka({
	"clientId": "myapp",
	"ssl": true,
	"brokers" :["kafka1:19092"],
	"connectionTimeout":10000,
	retryCount: 100,
	retryTime: 20000
})

const kafka2 = new Kafka({
	"clientId": "myapp1",
	"ssl": true,
	"brokers" :["kafka2:19093"],
	"connectionTimeout":10000,
	retryCount: 100,
	retryTime: 20000
})      

const kafka3 = new Kafka({
	"clientId": "myapp2",
	"ssl": true,
	"brokers" :["kafka3:19094"],
	"connectionTimeout":10000,
	retryCount: 100,
	retryTime: 20000
})

const producer_1 = kafka1.producer();
console.log("Connecting.....")
producer_1.connect()
console.log("Connected!")


const producer_2 = kafka2.producer();
console.log("Connecting.....")
producer_2.connect()
console.log("Connected!")


const producer_3 = kafka3.producer();
console.log("Connecting.....")
producer_3.connect()
console.log("Connected!")

const consumer_1 = kafka1.consumer({"groupId": "test"})
console.log("Connecting.....")
consumer_1.connect()
console.log("Connected!")

const consumer_2 = kafka2.consumer({"groupId": "test"})
console.log("Connecting.....")
consumer_2.connect()
console.log("Connected!")

const consumer_3 = kafka3.consumer({"groupId": "test"})
console.log("Connecting.....")
consumer_3.connect()
console.log("Connected!")


consumer_1.run({
	eachMessage: async ({ topic, partition, message }) => {
		console.log('Received message', {
			topic,
			partition,
			key: message.key.toString(),
			value: message.value.toString()
		});
		const result = producer_1.send({
			"topic": topic,
			"messages": [
				{
					"value": message + ", Hello user\n",
					"partition": String((parseInt(partition) + 1) % 10) 
				}
			]
		})
		console.log(result)

	}
});



consumer_2.run({
	eachMessage: async ({ topic, partition, message }) => {
		console.log('Received message', {
			topic,
			partition,
			key: message.key.toString(),
			value: message.value.toString()
		});
		const result = producer_2.send({
			"topic": topic,
			"messages": [
				{
					"value": message + ", Hello user\n",
					"partition": String((parseInt(partition) + 1) % 10)        
				}
			]
		})

	}
});



consumer_3.run({
	eachMessage: async ({ topic, partition, message }) => {
		console.log('Received message', {
			topic,
			partition,
			key: message.key.toString(),
			value: message.value.toString()
		});
		const result = producer_3.send({
			"topic": topic,
			"messages": [
				{
					"value": message + ", Hello user\n",
					"partition": String((parseInt(partition) + 1) % 10)
				}
			]
		})


	}
});
*/

