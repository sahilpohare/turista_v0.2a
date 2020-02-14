const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

const bodyParser = require('body-parser');



require('./models/wish')

//serving static files
app.use(express.static('public'))



app.use(bodyParser.urlencoded({extended: false}))

app.use(bodyParser.json())

//import routes
const routes = require('./routes')
routes(app)

app.set('view engine','ejs')





app.listen(port,()=>{
    console.log("server is running at port "+ port)
})