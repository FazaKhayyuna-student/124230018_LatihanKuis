import 'package:flutter/material.dart';

import 'package:latihankuis/homepage.dart';



class LoginPage extends StatefulWidget {

  const LoginPage({super.key});



  @override

  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {

  String username = "";

  String password = "";

  bool isLoginSuccess = true;



  @override

  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        appBar: AppBar(

          title: Center(child: Text("Login"),

         

          ),

          backgroundColor: Colors.indigo,

          foregroundColor: Colors.white,

        ),

        body: Column(

          children: [

            _usernameField(),

            _passwordField(),

            _LoginButton(context)

          ],

        ),

      ),

    );

  }



  Widget _usernameField() {

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: TextFormField(

        enabled: true,

        onChanged: (value) {

          username = value;

        },

        decoration: const InputDecoration(

          hintText: 'Username',

          contentPadding: EdgeInsets.all(8.0),

          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(8.0)),

            borderSide: BorderSide(color: Colors.blueAccent),

          ),

        ),

      ),

    );

  }



  Widget _passwordField() {

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: TextFormField(

        enabled: true,

        onChanged: (value) {

          password = value;

        },

        obscureText: true,

        decoration: const InputDecoration(

          hintText: 'Password',

          contentPadding: EdgeInsets.all(8.0),

          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(8.0)),

            borderSide: BorderSide(color: Colors.blueAccent),

          ),

        ),

      ),

    );

  }



  Widget _LoginButton(BuildContext context){

  return Container(

     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

     width: MediaQuery.of(context).size.width,

     child: ElevatedButton(

      style: ElevatedButton.styleFrom(

        foregroundColor: Colors.white,

        backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red

      ),

      onPressed: (){

        String text = "";

        if(username == "faza" && password == "12345"){

          setState(() {

          text = "login sukses";

          isLoginSuccess=true;

          });

            Navigator.pushReplacement(context,

             MaterialPageRoute(builder: (context){

               return homepage(username: username,);

             })

            );

          ;

        } else {

          setState(() {

          text = "login gagal";

          isLoginSuccess=false;        

          });

        }

        SnackBar snackBar = SnackBar(content: Text(text));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      },

      child: Text("Login"),

      // style: ElevatedButton.styleFrom(

      //   backgroundColor: Colors.blue

      // )

     

      )

  );

}


}

