var shell = require('shelljs')


try {
	shell.exec('./health_check.sh kafka1:19092 kafka2:19093 kafka3:19094', (err, stdout, stderr) => {
		if (err) {
			//some err occurred
			console.error(err)
			res.status(500)
			res.send("command failed\n")
		}
	}).on('exit', function() {
		try {
			console.log("starting server")
			shell.exec('node api.js ', (err, stdout, stderr) => {
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
	})
}
catch(e){
	console.log(e)
}

