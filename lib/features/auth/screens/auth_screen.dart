import 'package:amazoon_clone/common/widgets/custom_button.dart';
import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/features/auth/services/auth_servide.dart';
import 'package:flutter/material.dart';
import 'package:amazoon_clone/common/widgets/text_field.dart';

enum Auth{
  signin,
  signup
}

class AuthScreen extends StatefulWidget {

  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text
    );
  }

  void signInUser(){
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalConstants.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup ? GlobalConstants.backgroundColor : GlobalConstants.greyBackgroundCOlor,
                title: Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Radio(
                  activeColor: GlobalConstants.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if(_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(20.0),
                  color: GlobalConstants.backgroundColor,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomButton(
                              text: 'Sign Up',
                              onTap: (){
                                if(_signUpFormKey.currentState!.validate()){
                                  signUpUser();
                                }
                              }
                          )
                        ],
                      )
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin ? GlobalConstants.backgroundColor : GlobalConstants.greyBackgroundCOlor,
                title: Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Radio(
                  activeColor: GlobalConstants.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if(_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(20.0),
                  color: GlobalConstants.backgroundColor,
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomButton(
                              text: 'Sign In',
                              onTap: (){
                                if(_signInFormKey.currentState!.validate()){
                                  signInUser();
                                }
                              }
                          )
                        ],
                      )
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
