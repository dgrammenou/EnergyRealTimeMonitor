//This script will insert a row into our newly created table
const { getClient } = require('./get_client');

(async () => {
    const client = await getClient();
    const name = process.argv[2] ?? 'john';
    let insertRow = await client.query('INSERT INTO my_table(name) VALUES($1);', [`${name}`]);
    console.log(`Inserted ${insertRow.rowCount} row`);
    await client.end();
})();
// runs with: node ./add_data.js
//or even with ./add_data.js <name> e.g Patrick Bateman