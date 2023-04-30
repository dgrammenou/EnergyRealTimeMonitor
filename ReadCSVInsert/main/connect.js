//npm install dotenv
/*PG_HOST=<postgres hostname>
PG_PORT=<postgres port>
PG_USER=<postgres database user>
PG_PASSWORD=<postgres database password>
PG_DATABASE=<postgres database name>*/
const { Client } = require('pg');
require('dotenv').config();

(async () => {
    const client = new Client({
        /*     user: 'postgres',
            host: 'localhost',
            database: 'databse',
            password: 'password',
            port: 5432, */
        host: process.env.PG_HOST,
        port: process.env.PG_PORT,
        user: process.env.PG_USER,
        password: process.env.PG_PASSWORD,
        database: process.env.PG_DATABASE,
        ssl: false,
    })
    client.connect(function (err) {
        if (err) throw err;
        console.log("Connected!");
    })

    client.on("connect", () => {
        console.log("Database Connected")
    })

    client.on("end", () => {
        console.log("Connection Ended")
    })
    await client.connect();
    const res = await client.query('SELECT $1::text as connected', ['Connection to postgres successful!']);
    console.log(res.rows[0].connected);
    await client.end();
})();
