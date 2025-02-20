import 'package:flutter/cupertino.dart';

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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(child: Column(
        children: [
          SizedBox(height: 200,),
          Row(
            children: [
              Text('facebook', style: TextStyle(color: CupertinoColors.systemBlue, fontWeight: FontWeight.bold, fontSize: 25),),
            ],
          ),
          SizedBox(height: 20,),
          CupertinoTextField(
            placeholder: "Username",
            padding: EdgeInsets.all(13),


          ),
          SizedBox(height: 5,),
          CupertinoTextField(
            placeholder: "Password",
            padding: EdgeInsets.all(10),
            obscureText: hidePassword,
            suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye :  CupertinoIcons.eye_slash, size:20,), onPressed: (){
              setState(() {
                hidePassword = !hidePassword;
              });
            }),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CupertinoColors.systemBlue
            ),
            child: CupertinoButton(child: Text('Login', style: TextStyle(color: CupertinoColors.white),), onPressed: (){

            }),
          )

        ],
      )),
    ));
  }
}
