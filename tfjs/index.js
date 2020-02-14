const express = require('express');
const multer = require('multer');
const upload = multer({dest: __dirname + '/uploads/images'});
const repl = require('repl');
global.fetch = require('node-fetch');

// const spwan = require('child_process').spawn;
// const pythonProcess = spwan('python',['./rec_engine/rec.py']);

// pythonProcess.stdout.on('data',(data) => {
//     console.log(data);
// });

var myPythonScriptPath = './rec_engine/rec.py';

// Use python shell
const PythonShell = require('python-shell').PythonShell;

const shell = new PythonShell(myPythonScriptPath);

shell.on('message', function (message) {
    // received a message sent from the Python script (a simple "print" statement)
    console.log(message);
});


const app = express();
const PORT = 5000;


var fs = require('fs')

const tf = require('@tensorflow/tfjs');

const tfjs = require('@tensorflow/tfjs-node');

//require('@tensorflow/tfjs-node');







app.use(express.static('public'));



// app.get('/',async (req,res)=>{
//     var model;
//     console.log(req.body)
//     try {
//         model = await tfjs.loadLayersModel('file://public/m/model.json');
//         res.send('<h1>'+model.summary().json()+'</h1>');
//     }catch(e) {
//         console.log(e);
//     }finally{
     
//     }

// })

var model; 

var ctx = repl.start(' Model >');

async function loadmodel(path){
            model = await tfjs.loadLayersModel('file://public/m/model.json');
            ctx.context.model = model;
            console.log(model.summary());
            console.log(path);
            const imageBuffer = fs.readFileSync(__dirname+'/'+path);
            const tfimage = tfjs.node.decodeJpeg(imageBuffer);
            const resized = tfjs.image.resizeBilinear(tfimage,[128,128]);
            const resized2 = tfjs.expandDims(resized,axis=0)
            const predictions = await model.predict(resized2)
            console.log('Classification Results:', predictions.dataSync());



    }




app.post('/upload', upload.single('photo'), (req, res) => {
    if(req.file) {
        console.log(req.file.originalname)
        fs.rename(req.file.path, req.file.originalname, function (err) {
            if (err) throw err;
            console.log('File renamed')
            loadmodel(path=req.file.originalname)

        })
        res.json(req.file);
        
    }
    else throw 'error';
});

app.listen(PORT, () => {
    console.log('Listening at ' + PORT );
});