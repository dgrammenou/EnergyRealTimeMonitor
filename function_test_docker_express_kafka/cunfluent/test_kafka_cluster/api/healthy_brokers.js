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
                        shell.exec('node server_1.js ', (err, stdout, stderr) => {
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
		/*try {
                        shell.exec('node consumer.js ', (err, stdout, stderr) => {
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
                }*/
        } else {
                console.log("unexpected status = " + String(status) + ", please try again\n")
                return;
        } 

}, (error) => {
        statuss = 600
        console.error("Error: " + error);
        return;
});

