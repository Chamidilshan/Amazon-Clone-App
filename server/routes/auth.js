const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");

const authRouter = express.Router(); 

//SignUp route
authRouter.post('/api/signup', async (req, res) =>{
    try{
        const {name, email, password} = req.body;//get these parameters from client(frontend)

    const existingUser = await  User.findOne({email});
    if(existingUser) {
        return res.status(400).json({msg: "User with same email already exists"});
        //as it is some error with userdata we send it as a 400 request
    }

    const hashedPassword = await bcryptjs.hash(password, 8);//convert passwod to secure data

    let user = new User({
        email,
        password: hashedPassword,
        name,
    })

    user = await user.save();
    res.json(user);
    } catch (e) {
        res.status(500).json({error: e.message});//for a error message we use error in json
    };


})

module.exports = authRouter;  