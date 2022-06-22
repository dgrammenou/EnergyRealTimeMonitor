var {Kafka} = require('kafkajs');
//var {express} = require('express');
const http = require('http');
const axios = require('axios')

const kafka1 = new Kafka({
	"clientId": "myapp1",
	//"ssl": true,
	/*"sasl":{
		"mechanism":'plain'
	},*/	
	"brokers" :["kafka1:19092","kafka2:19093","kafka3:19094"]
	/*"connectionTimeout":10000,*/
	//"retryCount":5
	//retryTime: 20000*/
})


//const kafka2 = new Kafka({
//	"clientId": "myapp2",
	//"ssl": true,
	/*"sasl":{
		"mechanism":'plain'
	},*/	
//	"brokers" :["kafka1:19092","kafka2:19093","kafka3:19094"],
	/*"connectionTimeout":10000,
	retryCount: 100,
	retryTime: 20000*/
//})

//const kafka3 = new Kafka({
//	"clientId": "myapp3",
	//"ssl": true,
	/*"sasl":{
		"mechanism":'plain'
	},*/		
//	"brokers" :["kafka1:19092","kafka2:19093","kafka3:19094"],
	/*"connectionTimeout":10000,
	retryCount: 100,
	retryTime: 20000*/
//})

var total_function = async () => {
	const producer_1 = await kafka1.producer();
	console.log("Connecting.....")
	producer_1.connect()
	console.log("Connected!")


/*	const producer_2 = await kafka2.producer();
	console.log("Connecting.....")
	producer_2.connect()
	console.log("Connected!")


	const producer_3 = await kafka3.producer();
	console.log("Connecting.....")
	producer_3.connect()
	console.log("Connected!")*/

	const consumer_1 = await kafka1.consumer({"groupId": "test_response"})
	console.log("Connecting.....")
	consumer_1.connect()
	console.log("Connected!")

	/*const consumer_2 = await kafka2.consumer({"groupId": "test"})
	console.log("Connecting.....")
	consumer_2.connect()
	console.log("Connected!")

	const consumer_3 = await kafka3.consumer({"groupId": "test"})
	console.log("Connecting.....")
	consumer_3.connect()
	console.log("Connected!")*/

	console.log("Subscribing phase\n")
	await consumer_1.subscribe({topics:["maria"]})
	//await consumer_2.subscribe({topics:["orfeas"]})
	//await consumer_3.subscribe({topics:["despoina"]})	

	console.log("Above run of consumer1\n")
	consumer_1.run({
		//console.log("Inside run of consumer1\n")
		eachMessage: async ({ topic, partition, message }) => {
			//heartbeat();
			console.log('Received message', {
				topic,
				//replyId,
				partition,
				//key: message.key.toString(),
				value: message.value.toString()
			});
			json = JSON.stringify({
                                "topic": "orfeas",
                                //replyId: replyId,
                                "messages": [
                                        {
                                                "value": message.value.toString() + ", Hello user"
                                                //"partition": (parseInt(partition) + 1) % 10
                                        }
                                ]
                        })

			console.log("json = ", json);
			value = message.value.toString().split('/:');
			console.log("value: ", value)
			total_mess = value[0] + ", Hello user" + "/:" + value[1];
			console.log("total_mess: ", total_mess)
			//const result = await producer_1.send(json);
			const result = await producer_1.send({
				"topic": "orfeas",
				//replyId,
				"messages": [
					{
						//"value": message.value.toString() + ", Hello user"
						"value": total_mess
						//"partition": (parseInt(partition) + 1) % 10
					}
				]
			});
			console.log("result", result)

		}
	});

	/*console.log("above run of consumer2\n");
	consumer_2.run({
		//console.log("Inside run of consumer2\n")
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


	console.log("Above run of consumer3\n")
	consumer_3.run({
		//console.log("Inside run of consumer3\n")
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
	});*/

}

total_function();
