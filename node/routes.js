
const mongoose = require('mongoose');
const {mongourl} = require('./config/keys'); 

//const Wish = require('./models/wish');

const Wish = mongoose.model("wishes")


mongoose.connect(mongourl,{useNewUrlParser:true})


//var data = ['eat','sleep','code','repeat']

module.exports = (app)=>{
    app.get('/',(req,res)=>{
        Wish.find({}).then(data=>{
            console.log(data)
            res.render('home',{data:data})
        })

        
    })
    
    
    app.get('/about',(req,res)=>{
        res.render('about')
    })


    app.get('/profile/:id',(req,res)=>{

        data = {
            name : req.params.id
        }

        res.render('home', {data:data})
    })

    app.post('/sent',(req,res)=>{

        const Item = new Wish({
            wish:req.body.item
        });

        Item.save().then(data=>{
            console.log('Saved')
            res.send(data)
        })

        // console.log(req.body)
        // data.push(req.body.item)
        // res.send(data)
    })

    app.delete('/remove/:id',(req,res)=>{


        Wish.findOneAndDelete({wish:req.params.id}).then(data=>{
            console.log("Deleted")
            res.send(data)
        })
        // data = data.map(item=>{
        //     if(item!=req.params.id){
        //         return item
        //     }
        // })
        // console.log(req.params.id)
        // res.send(data)


    })
    
}