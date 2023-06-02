import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        User? user = userCredential.user  ;

        if(user != null){
          Navigator.pushNamed(context, '/HomePage');
        }
      }catch (e) {
          print('error email or mdp ');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/titre.png', fit: BoxFit.cover, width: MediaQuery.of(context).size.width -20,),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusColor: Color(0xFF766C42),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF766C42)),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFF766C42)),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusColor: Color(0xFF766C42),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF766C42)),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xFF766C42)),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      ),
                  ),
                ),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/Logout'), child: Text('Inscritpion', style: TextStyle(color: Colors.black),)),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Se connecter', style: TextStyle(color: Color(0xFF766C42))),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
