const options = {
    client: 'sqlite3',
    connection: {
        filename: "./users.sqlite"
      }
}

const knex = require('knex')(options);

knex.schema.createTableIfNotExists('user', (table) => {
    table.increments('id').primary()
    table.string('firstname')
    table.string('lastname')
    table.string('email')
    table.integer('daysLeft')   
}).then(() => console.log("table created"))
    .catch((err) => { console.log(err); }) 


function createNewUser(firstname, lastname, email) {
    const user = {
        firstname,
        lastname,
        email,
        daysLeft: 15,
    }
    knex('user').insert(user).then(() => console.log("data inserted"))
    .catch((err) => { console.log(err); }) 
} 

const express = require('express');
const cors = require('cors');

const app = express()
app.use(cors())  

const port = 4020;

app.get('/api/users/login', (   req, res) => {
    const user = req.query;
    console.log("start: ", user);
    knex.from('user').select("*")
        .where("firstname", user.firstname)
        .where("lastname", user.lastname)
        .where("email", user.email)
        .then((rows) => {  
            console.log(rows);
            if (rows.length && rows[0]) {
                res.send(rows[0]);
            } else {
                createNewUser(user.firstname, user.lastname, user.email);
                res.send({
                    ...user,
                    daysLeft: 15,
                });
            }
            
        })
        .catch((err) => { console.log( err);}) 
});

app.get('/api/users/extend', (req, res) => {
    const user = req.query;
    const extendPlan = parseInt(req.query.extend); 
    console.log(req.query);

    knex.from('user').select("*")
        .where("firstname", user.firstname)
        .where("lastname", user.lastname)
        .where("email", user.email)
        .then((rows) => {   
            if (rows.length && rows[0]) {
                rows[0].daysLeft += extendPlan; 
                knex.from('user').update(rows[0]).then(() => {
                    console.log("update occured");
                })
                res.send(rows[0]);
            } else {
                createNewUser(user.firstname, user.lastname, user.email);
                res.send({
                    ...user,
                    daysLeft: extendPlan,
                });
            }
            
        })
        .catch((err) => { console.log( err); }) 

})

app.get('/api/updateSubscriptions', (req, res) => {
    var users_external;
    var counter = 0;
    knex.from('user').select("*").then((users) => {
        users_external = users;
        console.log(users_external);
        for(var i = 0; i < users_external.length; i++) {
            users_external[i].daysLeft = Math.max(users_external[i].daysLeft - 1, 0);
            knex.from('user').update(users_external[counter++]).then(() => {
                console.log('update subscription');
            })
            .catch((err) => { console.log( err);}) 
        }
    
    })
    res.send(200);   
})
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
