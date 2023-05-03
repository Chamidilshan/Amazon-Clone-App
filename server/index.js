const express = require("express");
const mongoose = require("mongoose");
const authRouter = require('./routes/auth');
require('dotenv').config();

const PORT = 3000;
const app = express();
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB = "mongodb+srv://chamidilshan:" + DB_PASSWORD + "@cluster0.cxc29kz.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);
  
mongoose.connect(DB).then(()=>{
    console.log('connected to database sucessfully');
}).catch((e)=>{
    console.log(e);
})

app.listen(PORT, ()=>{
    console.log(`connected at port: ${PORT}`);
})