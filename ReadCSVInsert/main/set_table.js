//sets up a Postgres table, duuh.
const { getClient } = require('./get_client');

(async () => {
  const client = await getClient();
  let createTableQuery = `
    CREATE TABLE IF NOT EXISTS my_table(
      id BIGSERIAL PRIMARY KEY NOT NULL ,
      name varchar,
      date TIMESTAMP NOT NULL DEFAULT current_timestamp
    );
  `;
  const res = await client.query(createTableQuery);
  console.log(`Created table.`);
  await client.end();
})();

//runs with: node ./setup-table.js