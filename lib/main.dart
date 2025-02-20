import 'package:flutter/cupertino.dart';
import 'package:loginact1/homepage.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
      brightness: Brightness.dark
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = false;
  String error = "";

  bool isLogin(String username, String password) {
    if (username == "admin" && password == "123"){
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(child: Column(
        children: [
          SizedBox(height: 100,),
          Column(
            children: [
              Image.asset('images/spotact.png'),
              Text('Spotify', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,),),
            ],
          ),
          SizedBox(height: 40,),
          CupertinoTextField(
            controller: _username,
            placeholder: "Username",
            padding: EdgeInsets.all(13),




          ),
          SizedBox(height: 19,),
          CupertinoTextField(
            controller: _password,
            placeholder: "Password",
            padding: EdgeInsets.all(10),
            obscureText: hidePassword,
            suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye :  CupertinoIcons.eye_slash, size:20, color: CupertinoColors.systemGrey,), onPressed: (){
              setState(() {
                hidePassword = !hidePassword;
              });
            }),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGreen
            ),
            child: CupertinoButton(child: Text('Log In', style: TextStyle(color: CupertinoColors.black),), onPressed: (){
                isLogin(_username.text, _password.text) ?

                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> Homepage()))
                : setState(() {
                  _username.text = "";
                  _password.text = "";
                  error = "Incorrect Username or Password";
                });
            }),
          ),


          SizedBox(height: 10,),
          Text("$error", style: TextStyle(color: CupertinoColors.destructiveRed),)
        ],
      )),
    ));
  }
}
