var express = require('express');
var {Kafka} = require('kafkajs');
var app = express();
var fs = require("fs");



app.get('/sendMessage/:message/:topic/:partition', function (req, res) {
	const kafka = new Kafka({
		"clientId": "myapp",
		"brokers" :["kafka1:9092"]
	})
	const producer = kafka.producer();
	console.log("Connecting.....")
	producer.connect()
	console.log("Connected!")

	const result = producer.send({
		"topic": req.params.topic,
		"messages": [
			{
				"value": req.params.message,
				"partition": req.params.partition
			}
		]
	})

	console.log(`Send Successfully! ${JSON.stringify(result)}`)
	producer.disconnect();

	const consumer = kafka.consumer({"groupId": "test"})
	console.log("Connecting.....")
	consumer.connect()
	console.log("Connected!")

	consumer.subscribe({
		"topic": req.params.topic,
		"partition": req.params.partition,		
		"fromBeginning": true
	})

	consumer.run({
		eachMessage: async ({ topic, partition, message }) => {
			console.log('Received message', {
				topic,
				(partition + 1) % 10 ,
				key: message.key.toString(),
				value: message.value.toString()
			});
			var data = {
				"topic": topic,
				"message": rq.params.message,
				"partition": String((parseInt(partition) + 1) % 10),
				"message in ascii": message
			};

			send.json(data);
		}
	});
	consumer.disconnect();

});

var server = app.listen(8081, function () {
	var host = server.address().address
	var port = server.address().port
	console.log("Example app listening at http://%s:%s", host, port)
})
