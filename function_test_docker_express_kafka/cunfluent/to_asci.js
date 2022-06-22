var {Kafka} = require('kafkajs');

const kafka1 = new Kafka({
	"clientId": "myapp",
	"brokers" :["kafka1:9092"]
})

const kafka2 = new Kafka({
	"clientId": "myapp1",
	"brokers" :["kafka2:9093"]
})      

const kafka3 = new Kafka({
	"clientId": "myapp2",
	"brokers" :["kafka3:9093"]
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

