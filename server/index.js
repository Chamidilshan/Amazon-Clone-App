const express = require("express");
const mongoose = require("mongoose");
const authRouter = require('./routes/auth');
require('dotenv').config();

const PORT = 3000;
const app = express();
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB = "mongodb+srv://chamidilshan:" + DB_PASSWORD + "@cluster0.cxc29kz.mongodb.net/?retryWrites=true&w=majority";

app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

app.use(express.json());
app.use(authRouter);
  
mongoose.connect(DB).then(()=>{
    console.log('connected to database sucessfully');
}).catch((e)=>{
    console.log(e);
})

app.listen(PORT, "0.0.0.0",  ()=>{
    console.log(`connected at port: ${PORT}`);
})