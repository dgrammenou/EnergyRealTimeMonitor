var express = require('express');
var {Kafka} = require('kafkajs');


var app = express();
//var fs = require("fs");

const fs = require('fs');
const net = require('net');


var temp_server = net.createServer(function(stream) {
        stream.on('data', function(c){
                console.log('data', c.toString());
		//res.send(data);
        });
        
});

console.log('before listen');

temp_server.listen('my_sock.sock');

process.on('SIGINT', () => {
        temp_server.close();
});


const kafka = new Kafka({
	"clientId": "myapp",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
	//"retryCount":5
});
const producer = kafka.producer();
//const consumer = kafka.consumer({"groupId": "test_api"})

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");
/*console.log("Consumer Connecting.......")
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


var sendMessage = (req, producer) => {
	/*console.log("Producer Connecting.....")	
	await producer.connect()
	console.log("Producer Connected!")	*/
	/*await producer.send({
    topic: 'topic-name',
    messages: [
      { key: 'key1', value: 'hello world' },
      { key: 'key2', value: 'hey hey!' }
    ],
  })
	producer.send({
		topic: "maria",
		messages: [
			{
				"value": req.params.message
				//"partition": req.params.partition
			}
		]
	}).then(() => {
		console.log("message sent\n");
		//producer.disconect();
	})
		.catch(e => console.log("an error occured: " + e))
	//console.log("Before producer disconnection...")
	//await producer.disconnect()
	//console.log("Producer disconnected!")
}

var send_back = (res, data) => {
	return new Promise((resolve,reject) => {
	
		resolve(data);
	});
}	

var receiveMessage = (res, req, producer, consumer, data) => {
	sendMessage(req, producer);
	/*console.log("Consumer Connecting.......")
	await consumer.connect()
	console.log("Consumer Connected!")
	await consumer.subscribe({
		topic: "orfeas",
		//partition: (parseInt(req.params.partition) + 1) % 10,
		//"fromBeginning": true
	})

	console.log("after subscribe");
	console.log("consumer:")
	console.log(consumer)
	console.log("Above consumer run\n")
	consumer.run({
		//console.log("In consumer run\n")
		eachMessage: ({ topic, partition, message }) => /*res.send({ "topic":topic, "partiotion":partition, "message":message })}*/ {
			//heartbeat();
			/*console.log('Received message', {
				topic,
				partition,
				//key: message.key.toString(),
				value: message.value.toString()
			});
			data.Data = {
				"topic": topic,
				//"message": rq.params.message,
				"partition": parseInt(partition),
				"message in ascii": message.value.toString()
			};
			console.log("data = ", data)
			//consumer.stop()
			//return res.send(data);
			
			send_back(res, data).then((data) => {
				return res.send(data);
			});
		}
	}).then((res) => {
		console.log("inside then")
		console.log("data = ", data)
		res.send(data)
	})
	.catch((error) => {
		console.error("inside catch error", error);
		res.send(data);
	});*/
	//consumer.disconnect()
	//return res.send("data = ", data)
	
//}


app.get('/sendMessage/:message/', async function (req, res) {
	console.log("inside endpoint");
	console.log("message = " + req.params.message)
	const result = await producer.send({
                topic: "maria",
                messages: [
                        {
                                "value": req.params.message
                                //"partition": req.params.partition
                        }
                ]
        });
	console.log("after sent message with result:", result);

	
	//console.log("topic = " + req.params.topic)
	//console.log("partiotion = " + req.params.partition)
	/*const kafka = new Kafka({
		"clientId": "myapp",
		"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
		//"retryCount":5
	})
	const producer = kafka.producer();*/
	/*console.log("Connecting.....")
	producer.connect()
	console.log("Connected!")*/

	/*const result = producer.send({
		"topic": req.params.topic,
		"messages": [
			{
				"value": req.params.message,
				"partition": req.params.partition
			}
		]
	}).then(() => {
		console.log("message sent\n");
	//producer.disconect();
	})
	.catch(e => console.log("an error occured: " + e))*/

	//sendMessage(producer);


	//console.log("i send the message");

	//console.log(`Send Successfully! ${JSON.stringify(result)}`)
	//producer.disconnect();

	//const consumer = kafka.consumer({"groupId": "test_api"})
	/*console.log("Connecting.....")
	consumer.connect()
	console.log("Connected!")*/

	/*consumer.subscribe({
		"topic": req.params.topic,
		"partition": String((parseInt(req.params.partition) + 1) % 10),		
		"fromBeginning": true
	})*/
	//console.log("after subscribe");
	//var data = {
	//	Data: {}
	//};	
	//receiveMessage(res, req, producer, consumer, data);
	//return res.send(data);	
	/*consumer.run({
		eachMessage: async ({ topic, partition, message }) => {
			console.log('Received message', {
				topic,
				partition,
				key: message.key.toString(),
				value: message.value.toString()
			});
			var data = {
				"topic": topic,
				"message": rq.params.message,
				"partition": partition,
				"message in ascii": message
			};

			send.json(data);
		}
	});
	console.log("before disconnect")
	consumer.disconnect();*/
	//producer.disconnect();
	console.log("i am actually exiting with data = ", data);
	return;
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
