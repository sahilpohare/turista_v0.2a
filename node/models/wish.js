const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const WishSchema = Schema({
    wish:String
});

//module.exports = mongoose.model('wishes',WishSchema)

//without exporting

mongoose.model('wishes',WishSchema)