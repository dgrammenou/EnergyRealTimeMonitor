// Απαραίτητα imports!
const express = require('express');
// const cors = C/
const {Kafka} = require('kafkajs');
const pg = require('pg');
const axios = require('axios');
const cors = require('cors');

const app = express()
app.use(cors())  

//Συνάρτηση για sortarisma javascript object
function compare( a, b ) {
	if ( a.datetime < b.datetime ){
	  return -1;
	}
	if ( a.datetime > b.datetime ){
	  return 1;
	}
	return 0;
}

// Object το οποίο μας χρειάζεται προκειμένου να εξυπηρετεί clients που ζητάνε (ταυτόχρονα) ίδια δεδομένα προκειμένου να κάνουμε ένα SELECT στη βάση!
const getData = Object.create(null);

// Λίστα με τις χώρες που μας χρειάζεται.
countries = ['al','am','at','az','ba','be','bg','by','cy','cz','de','dk','ee','es','fi','fr','gb','ge','gr','hr','hu','ie','it','lt','lu','lv','md','me','mk','no','pl','nl','mt','pt','ro','rs','se','si','sk','tr','ua','xk', 'ru', 'ch']
	
const pgp = require('pg-promise')({
    
    capSQL: true 
})

//Παράμετροι για σύνδεση με τη βάση.
const db=pgp({
    host:"agpt_display_db",
    port:5432,
    user:"postgres",
    password:"Dd2502!..",
    database:"displayforagpt"
})

//Σύνδεση με τη βάση!
db.connect()

// Δημιουργία Kafka consumer και producer! 
const kafka = new Kafka({
        "clientId": "SaaS-2022",
        "brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
    
});

const consumer = kafka.consumer({"groupId": "agpt_cons"})

console.log("Consumer Connecting.......")
consumer.connect()

console.log("Consumer Connected!")
consumer.subscribe({
        topic: "agpt",
});


//producer config and connection!
const producer = kafka.producer();

console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");


//consumer code
//----------------------------------
//Παίρνουμε τα μηνύματα που λαμβάνουμε από το topic που έχουμε κάνει subscribe!
consumer.run({
	eachMessage: ({ topic, partition, message }) =>  {
		console.log('Received message', {
			topic,
			partition,
			value: message.value.toString()
		});

		data = {
			"topic": topic,
			"partition": parseInt(partition),
			"message in ascii": message.value.toString()
		};

		//Παίρνουμε το μήνυμα από τον αντίστοιχο getter!
		var arr=data["message in ascii"].split(":")
		
		//Εάν το μήνυμα ξεκινάει με NEW DATA τότε πρέπει να χτυπήσουμε το αντίστοιχο endpoint του getter προκειμένου να πάρουμε τα καινούργια δεδομένα!
		if(arr[0] === "NEW DATA"){
             
			url="http://agpt_getter:8081/newData/" + arr[1].toLowerCase();
			console.log("url =", url);
            //Αξιοποιώντας το axios πραγματοποιούμε το GET request στον αντίστοιχο getter.
			axios.get(url).then((response) =>{
				const datafinal = Object.values(response.data);
				//Απαραίτητοι έλεγχοι για τα δεδομένα που λαμβάνουμε!
				if(datafinal != undefined){
					if(datafinal.length!=0){
						//Άμα εν τέλει μας στείλει δεδομένα ο getter τα βάζουμε στη βάση (στο table της αντίστοιχης χώρας)!
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
			.catch((error) => {
				console.log(error)
			})
        }
				
	}
});



//Endpoint το οποίο χτυπάει το frontend προκειμένου να λάβει τα καινούργια δεδομένα!
app.get("/api/GenerationPerType/chart", (req, res, next) => {
	
	//Παίρνουμε τη παράμετρο date που μας δίνει το frontend.
	var date = req.query.date
	var date_start = date + " 00:00:00";
	var date_end = date + " 23:59:59";

	console.log("req = ", req.query);
	if(!req.query) {
		res.status(500).send("Invalid request format");
		return;
	}
	
	
	// const replyId = Math.random().toString().substr(2);
	//Όπως προαναφέρθηκε το getData χρησιμοποιείται για να απαντάμε σε περισσότερους του ενός client (που θέλουν τα ίδια δεδομένα) με ένα SELECT στη βάση.
	// if(!getData[(req.query.country, req.query.generationType, req.query.date)]){
	// 	console.log("init array for getData");
	// 	//Άμα είναι ο πρώτος client που ζητά τα δεδομένα αυτά τότε δημιουργούμε την παρακάτω κενή λίστα  
	// 	getData[(req.query.country, req.query.generationType, req.query.date)] = [];
	// }
	
	//Κάνουμε push τον καινούργιο client στη λίστα (άμα είναι ο πρώτος τότε θα είναι ο μόνος μέσα στη λίστα, αλλιώς απλά θα γίνει append στο τέλος της). 
	// getData[(req.query.country, req.query.generationType, req.query.date)].push([replyId, res]);
	//avoid multiple DB requests
	//Άμα (αφού έχουμε pusharei τον client στη λίστα) το μέγεθος της λίστας είναι μεγαλύτερο του 1 σημαίνει πως και άλλος/άλλοι client/s θέλει/ουν τα δεδομένα αυτά
	//και για το λόγο αυτό δεν κάνουμε SELECT στη βάση αλλά περιμένουμε να μας απαντήσει προηγούμενο request κάνοντας έτσι μόνο ένα select στη βάση μας!  
	// if(getData[(req.query.country, req.query.generationType, req.query.date)].length > 1){
	// 	console.log("someone else will respond to this request");
	// 	return;
	// }	
	
	//Αλλιώς σημαίνει πως ο client αυτός είναι ο μόνος τη χρονική αυτή στιγμή που θέλει τα δεδομένα και για το λόγο αυτό κάνει το αντίστοιχο SELECT στη βάση!
	else {

		//Παίρνουμε τις υπόλοιπες παραμέτρους.
		var country=req.query.country.toLocaleLowerCase();
		var typeofenergy=req.query.generationType
		console.log("query =", "SELECT * FROM public." + country + " WHERE public." + country + ".productiontype = " + "\'" + typeofenergy + "\'" + " AND public." + country + ".datetime >= " + "\'" + date_start + "\'" + " AND public." + country + ".datetime <= " + "\'" + date_end + "\';")

		//Εκτελούμε κατάλληλο QUERY προκειμένου να πάρουμε τα δεδομένα! 
		var get_query= db.query(
               
			"SELECT * FROM public." + country + " WHERE public." + country + ".productiontype = " + "\'" + typeofenergy + "\'" + " AND public." + country + ".datetime >= " + "\'" + date_start + "\'" + " AND public." + country + ".datetime <= " + "\'" + date_end + "\';"
		 )
		 .then((result) =>{

				// console.log("result =", result)
				result.sort(compare);
				// console.log("result after sort =", result);
				return_dict = {name: "AGPT chart", series: [], lastUpdate: "0000-00-00 00:00:00"}
				return_list = []
				for(var j =0; j < result.length; j++){
					// console.log("result.updatetime =", result[j].updatetime);
					var date_string = result[j].updatetime.toString();
					var current_date = date_string.replace("T", " ").replace("Z", "");
					if (return_dict.lastUpdate <= current_date){
						return_dict.lastUpdate = current_date;
					} 
					return_list[j] = {name: j, value:result[j].actualgenerationpertype};
				}
				Object.assign(return_dict.series, return_list);
				console.log("before sending re result");
				res.status(200).send(return_dict);	
				//Στέλνουμε τα δεδομένα σε όσους τα έχουν ζητήσει/βρίσκονται στην αντίστοιχη λίστα!
			 	// for(var i=0; i<getData[(req.query.country, req.query.generationType, req.query.date)].length; i++){
				// 	getData[(req.query.country, req.query.generationType, req.query.date)][i][1].status(200).json(return_dict);
				// }

				// //Αρχικοποιούμε τη λίστα ξανά στο κενό αφού έχουμε απαντήσει στους clients!
				// getData[(req.query.country, req.query.generationType, req.query.date)] = [];
		 })
		 .catch((e) => {
				console.log(e);
				res.status(500).send("something went wrong.\n");                
		 });
	}

});

app.get("/agpt/ResetDB", (req, res, next) => {
  
	var query = pgp.helpers.concat([
		'DELETE FROM  public.al',
		'DELETE FROM  public.am',
		'DELETE FROM  public.at',
		'DELETE FROM  public.az',
		'DELETE FROM  public.ba',
		'DELETE FROM  public.be',
		'DELETE FROM  public.bg',
		'DELETE FROM  public.by',
		'DELETE FROM  public.cy',
		'DELETE FROM  public.cz',
		'DELETE FROM  public.de',
		'DELETE FROM  public.dk',
		'DELETE FROM  public.ee',
		'DELETE FROM  public.es',
		'DELETE FROM  public.fi',
		'DELETE FROM  public.fr',
		'DELETE FROM  public.gb',
		'DELETE FROM  public.ge',
		'DELETE FROM  public.gr',
		'DELETE FROM  public.hr',
		'DELETE FROM  public.hu',
		'DELETE FROM  public.ie',
		'DELETE FROM  public.it',
		'DELETE FROM  public.lt',
		'DELETE FROM  public.lu',
		'DELETE FROM  public.lv',
		'DELETE FROM  public.md',
		'DELETE FROM  public.me',
		'DELETE FROM  public.mk',
		'DELETE FROM  public.no',
		'DELETE FROM  public.pl',
		'DELETE FROM  public.nl',
		'DELETE FROM  public.mt',
		'DELETE FROM  public.pt',
		'DELETE FROM  public.ro',
		'DELETE FROM  public.rs;',
		'DELETE FROM  public.se',
		'DELETE FROM  public.si',
		'DELETE FROM  public.sk',
		'DELETE FROM  public.tr',
		'DELETE FROM  public.ua',
		'DELETE FROM  public.xk',
		'DELETE FROM  public.ch',
		'DELETE FROM  public.ru'
	])
	
	db.none(query)
	.then(()=>{
			console.log("all records for display deleted!");
			res.status(200).send("DB cleared and CSV counter set 0!")
	})
	.catch(error => {
			console.log("error is", error);
			res.status(500).send("Something went wrong!")
	})
})

//Βοηθητικό endpoint.
app.get("/api/healthCheck", (req, res, next) => {
        res.status(200).send("I am healthy");
}); 

app.listen(7081, () => {
 console.log("Server running on port 7081");
});


//Στο παρακάτω κώδικα κάνουμε ένα αρχικό GET request στον αντίστοιχο getter στο endpoint getInidata προκειμένου να γίνει η αρχικοποίηση της βάσης
//με όλα τα δεδομένα που έχει στη βάση του ο getter!
//Αυτό προφανώς το κάνουμε για το table της κάθε χώρας.
counter_for_countries = 0;
for(var i = 0; i < countries.length; i++){
	url="http://agpt_getter:8081/getIniData/" + countries[i];
	console.log("url =", url);
	//Αξιοποιώντας το axios πραγματοποιούμε το GET request στον αντίστοιχο getter.
	axios.get(url).then((response) =>{
		const datafinal = Object.values(response.data);
		//Απαραίτητοι έλεγχοι για τα δεδομένα που λαμβάνουμε!
		if(datafinal != undefined){
			if(datafinal.length!=0){
				//Άμα εν τέλει μας στείλει δεδομένα ο getter τα βάζουμε στη βάση (στο table της αντίστοιχης χώρας)!
				const cs=new pgp.helpers.ColumnSet(['datetime','actualgenerationpertype','actualconsumption','productiontype','updatetime','index'],
					{table: countries[counter_for_countries].toLowerCase()}
				);
				const query =pgp.helpers.insert(datafinal, cs)
				db.none(query)
				.then(()=>{
					console.log("all records for display inserted")
				})
				.catch(error => {
					console.log("error is", error)
				})  		
			}
			counter_for_countries++;	
		}
	})
	.catch((error) => {
		console.log(error)
	})
}