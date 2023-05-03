const express = require("express");
const mongoose = require("mongoose");
const authRouter = require('./routes/auth');

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://chamidilshan:Chamika5$@cluster0.cxc29kz.mongodb.net/?retryWrites=true&w=majority";

app.use(authRouter);
 
mongoose.connect(DB).then(()=>{
    console.log('connected to database succefully');
}).catch((e)=>{
    console.log(e);
})

app.listen(PORT, ()=>{
    console.log(`connected at port: ${PORT}`);
})