const pg = require('pg');

const {Client} = require('pg');

const pgp = require('pg-promise')({

	capSQL: true 
})

const db=pgp({
	host:"localhost",
	port:5432,
	user:"postgres",
	password:"Dd2502!..",
	database:process.argv[2].toString()
})    


db.connect()
// console.log(db)

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
	console.log("all records for display deleted for", process.argv[2])
	process.exit(0);
})
.catch(error => {
	console.log("error is", error)
})
.finally( () => {
	pgp.end;
})




