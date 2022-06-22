var {Kafka} = require('kafkajs');
const kafka1 = new Kafka({
        "clientId": "myapp",
        "ssl": true,
        "brokers" :["kafka1:9092"],
        "connectionTimeout":10000,
        retryCount: 100,
        retryTime: 20000
})


const producer_1 = kafka1.producer();
console.log("producer_1:")
console.log(producer_1)
console.log("Connecting.....")
producer_1.connect()
console.log("Connected!")


