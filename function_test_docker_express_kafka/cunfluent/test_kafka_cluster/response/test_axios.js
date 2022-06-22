const axios = require('axios')

var statuss = 0;

console.log("before http request")
console.log("request is = http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094")
//http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094
axios.get('http://_node_kafkacat:3000/health_check/kafka1:19092,kafka2:19093,kafka3:19094').then((response) => {
        console.log('inside promise')
        statuss = response.status;
        console.log(statuss)
}, (error) => {
        statuss = 600
        console.error("Error: " + error);
        return;
});

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

console.log("SUCCESS, OUTSIDE WHILE\n")
