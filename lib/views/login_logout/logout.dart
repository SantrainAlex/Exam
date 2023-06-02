import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final _formKey = GlobalKey<FormState>();


  late String _email;
  late String _password;
  late String _firstName;
  late String _lastName;
  late String _pseudo;

  Future<void> _submitForm() async {

    if (_formKey.currentState!.validate()) {
      try{
        print(_password);
        print(_email);
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        var user = await FirebaseAuth.instance.currentUser;
        var profileUpdates = user?.updateProfile(displayName: "$_firstName $_lastName" );
        if(user != null){
          Navigator.pushNamed(context, '/HomePage');
        }
      }catch (e) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Votre mot de pass ou votre email est incorrect'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
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
                  height: 60,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre Nom';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _lastName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFF766C42),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF766C42)),
                      ),
                      labelText: 'Nom',
                      labelStyle: TextStyle(color: Color(0xFF766C42)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre prenom';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _firstName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFF766C42),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF766C42)),
                      ),
                      labelText: 'Prenom',
                      labelStyle: TextStyle(color: Color(0xFF766C42)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
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
                  height: 60,
                  child: TextFormField(
                    obscureText: true,
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFF766C42),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF766C42)),
                      ),
                      labelText: 'mot de passe',
                      labelStyle: TextStyle(color: Color(0xFF766C42)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      } else if (_password != value){
                        return 'Mot de passe différent';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFF766C42),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF766C42)),
                      ),
                      labelText: 'confirm ton mot de passe',
                      labelStyle: TextStyle(color: Color(0xFF766C42)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre Pseudo';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _pseudo = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFF766C42),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF766C42)),
                      ),
                      labelText: 'Pseudo',
                      labelStyle: TextStyle(color: Color(0xFF766C42)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Se connecter', style: TextStyle(color: Color(0xFF766C42) )),
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
