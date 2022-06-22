var express = require('express');
var {Kafka} = require('kafkajs');


var app = express();
//var fs = require("fs");

const fs = require('fs');
//const net = require('net');


/*var temp_server = net.createServer(function(stream) {
	stream.on('data', function(c){
		console.log('data', c.toString());
//res.send(data);
	});

});*/
const kafka = new Kafka({
	"clientId": "myapp",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
	//"retryCount":5
});

const responses = Object.create(null);

const consumer = kafka.consumer({"groupId": "test_api"})


console.log("Consumer Connecting.......")
consumer.connect()
console.log("Consumer Connected!")
consumer.subscribe({
	topic: "orfeas",
	//partition: (parseInt(req.params.partition) + 1) % 10,
	//"fromBeginning": true
})

console.log("after subscribe");
console.log("consumer:")
console.log(consumer)


/*consumer.on('message', (data) => {
	const result = JSON.parse(data)
	const res = responses[result.replyId]
	res.status(200).send(result)
});*/

consumer.run({
	eachMessage: async ({ topic, partition, message}) => {
		try{
			console.log("data from api, received: ", message.value.toString());
			mess = message.value.toString();
			value = mess.split("/:");
			console.log("value: ", value);
			const res = responses[value[1]];
			console.log(res)
			res.status(200).send(value[0]);
			//const result = JSON.parse(data)
			//const res = responses[result.replyId]
			//res.status(200).send(result)
		}
		catch(error){
			console.log("error: ", error)
		}	
	}
});	

/*console.log('before listen');

temp_server.listen('my_sock.sock');

process.on('SIGINT', () => {
	temp_server.close();
	process.exit(1);	
});*/


/*const kafka = new Kafka({
	"clientId": "myapp",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
//"retryCount":5
});*/
const producer = kafka.producer();
//const consumer = kafka.consumer({"groupId": "test_api"})

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");

app.get('/sendMessage/:message/', async function (req, res) {

	const replyId = Math.random().toString().substr(2);
	responses[replyId] = res;
	console.log("inside endpoint");
	console.log("message = " + req.params.message)
	/*var temp_server = net.createServer(function(stream) {
		stream.on('data', function(c){
			console.log('data', c.toString());
			return res.send(data);
			temp_server.close();
		});
/*stream.on('end', () => {
			temp_server.close();	
		});
	});*/



//console.log('before listen');

//temp_server.listen('my_sock.sock');

/*process.on('SIGINT', () => {
		temp_server.close();
		process.exit(1);
	});*/
	json = JSON.stringify({
		topic: "maria",
		//replyId: replyId,
		messages: [{
			"value": req.params.message + "/:" + replyId
			//"partition": req.params.partition
		}
		]
	});
	console.log("json = ", json);
	//const result = await producer.send(json);
	const result = await producer.send({
		topic: "maria",
		//replyId: replyId,
		messages: [{
			"value": req.params.message + "/:" + replyId
			//"partition": req.params.partition
		}
		]
	});
console.log("after sent message with result:", result);
//console.log("i am actually exiting with data = ", data);
//return;
});


app.get('/health', function(req,res){
	console.log('healthy connection');
	res.statusCode = 200;
	res.send('healthy\n');
});

var server = app.listen(8081, function () {
	var host = server.address().address;
	var port = server.address().port;
	console.log("Example app listening at http://%s:%s", host, port);
});

