const express = require('express');
const {Kafka} = require('kafkajs');
const pg = require('pg');
const axios = require('axios');
var app = express();

const getData = Object.create(null);

countries = ['al','am','at','az','ba','be','bg','by','cy','cz','de','dk','ee','es','fi','fr','gb','ge','gr','hr','hu','ie','it','lt','lu','lv','md','me','mk','no','pl','nl','mt','pt','ro','rs','se','si','sk','tr','ua','xk', 'ru', 'ch']

const {Client} = require('pg');

const pgp = require('pg-promise')({

	capSQL: true 
})

const db=pgp({
	host:"host.docker.internal",
	port:5432,
	user:"postgres",
	password:"Dd2502!..",
	database:"displayforatl"
})




db.connect()

//consumer and producer here

const kafka = new Kafka({
	"clientId": "SaaS-2022",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]

});

const consumer = kafka.consumer({"groupId": "atl_cons"})

console.log("Consumer Connecting.......")
consumer.connect()

console.log("Consumer Connected!")
consumer.subscribe({
	topic: "atl",
});


//producer config and connection!

const producer = kafka.producer();

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");





//res.status(200).send(value[0]);

//consumer code
//----------------------------------
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

		var arr=data["message in ascii"].split(":")
		//if the message is new data then get request to getter to get the data 
		//and on end we insert them on DB

		if(arr[0]=== "NEW DATA"){

			url="http://atl_getter:8082/newData/" + arr[1].toLowerCase();
			console.log("url =", url);
			//axios get request to agpt getter for new data and insert new data to db
			axios.get(url).then((response) =>{
				//data to insert to db
				// console.log(response.data)
				const datafinal = Object.values(response.data);
				// console.log("datafinal =", datafinal);
				if(datafinal != undefined){
					if(datafinal.length!=0){
						const cs=new pgp.helpers.ColumnSet(['datetime','totalloadvalue','updatetime','index'],{table:arr[1].toLowerCase()})
						const params =pgp.helpers.insert(datafinal,cs)
						db.none(params)
							.then(()=>{
								console.log("all records for display inserted")
							})
							.catch(error => {
								console.log("error is", error)
							})  		
					}
				}
			})
		}

	}
});




app.get("/api/:country/:date", (req, res, next) => {

	var date = req.params.date

	var date_start = date + " 00:00:00";
	var date_end = date + " 23:59:59";

	console.log("req = ", req.params);
	if(!req.params) {
		res.status(500).send("Invalid request format");
		return;
	} 
	//check if data is <= to last data
	
	const replyId = Math.random().toString().substr(2);
	if(!getData[(req.params.country, req.params.generationType, req.params.date)]){
		console.log("init array for getData");
		getData[(req.params.country, req.params.generationType, req.params.date)] = [];
	} 
	getData[(req.params.country, req.params.generationType, req.params.date)].push([replyId, res]);
	console.log(getData);
	if(getData[(req.params.country, req.params.generationType, req.params.date)].length > 1){
		console.log("someone else will respond to this request");
		return;
	}		

	else {

		var country=req.params.country
		var date=req.params.date
		console.log("params =", "SELECT * FROM " + country + " WHERE datetime >= " + "\'" + date_start + "\' AND datetime <= " + "\'" + date_end + "\'" + ";")        
		var get_params= db.query(
			"SELECT * FROM " + country + " WHERE datetime >= " + "\'" + date_start + "\' AND datetime <= " + "\'" + date_end + "\';"
		)
		.then((result) =>{
			console.log(result);
			for(var i=0; i<getData[(req.params.country, req.params.generationType, req.params.date)].length; i++){
				getData[(req.params.country, req.params.generationType, req.params.date)][i][1].status(200).json(result);
			}
			getData[(req.params.country, req.params.generationType, req.params.date)] = [];
		})
		.catch((e) => {
			console.log("error =", e);
			res.status(500).send("something went wrong");                
		}); 	

		//Select from db the data and on end res.status(200).send(json Data) 
		//on end also i should iterate throught the list (getData) of candidate (for the specific (country, genType, data)) clients and send them the data)
		//after that pop them from the list (getData)
	}

});

app.listen(7082, () => {
	console.log("Server running on port 7082");
});


for(var i = 0; i < countries.length; i++){
	url="http://atl_getter:8082/getIniData/" + countries[i];
	console.log("url =", url);
	//axios get request to agpt getter for new data and insert new data to db
	axios.get(url).then((response) =>{
		// console.log(response.data)
		const datafinal = Object.values(response.data);
		console.log("datafinal =", datafinal);
		if(datafinal != undefined){
			if(datafinal.length!=0){
				const cs=new pgp.helpers.ColumnSet(['datetime','actualgenerationpertype','actualconsumption','productiontype','updatetime','index'],{table:arr[1].toLowerCase()})
				const query =pgp.helpers.insert(datafinal, cs)
				db.none(query)
				.then(()=>{
					console.log("all records for display inserted")
				})
				.catch(error => {
					console.log("error is", error)
				})  		
			}	
		}
	})
}	