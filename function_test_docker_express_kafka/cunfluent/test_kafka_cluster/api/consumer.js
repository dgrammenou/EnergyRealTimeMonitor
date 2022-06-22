var {Kafka} = require('kafkajs');

const net = require('net');

/*var stream = net.connect('my_sock.sock');
console.log('before connect');*/



const kafka = new Kafka({
	"clientId": "myapp",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
	//"retryCount":5
})

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
		console.log("data = ", data);
		var stream = net.connect('my_sock.sock');
		console.log('after connect');
		stream.write(message.value.toString()); 
		stream.destroy();
	}
});


