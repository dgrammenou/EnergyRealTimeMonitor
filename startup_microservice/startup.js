var express = require("express");
const app = express();
const { exec } = require('child_process');
const shell = require('shelljs');

app.get("/health_check/:brokers", (req, res, next) => {
	console.log("INSIDEEEEEE")
	var we_can = req.params.brokers.split(',');
	console.log("we_can:")
	console.log(we_can)
	var args = ""
	for (const i in we_can){
		args = args + String(we_can[i]) + " "
	}	
	console.log("command is ./health_check.sh " + args);
	try {
		shell.exec('./health_check.sh ' + args, (err, stdout, stderr) => {
			if (err) {
				//some err occurred
				console.error(err)
				res.status(500)
				res.send("command failed\n")
			}
		}).on('exit', function() {res.sendStatus(200);}) // code =>  
		//res.status(200)

		//)
	}
	catch(e){
		console.log(e)
	}
			

});

app.get("/check_state", (req, res) => {res.send("All good")});


app.listen(3000, () => {
	console.log("Server running on port 3000");
});
