import 'package:flutter/cupertino.dart';
import 'package:loginact1/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Spotify', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
        trailing: CupertinoButton(child: Icon(CupertinoIcons.person_circle), onPressed: (){
          showCupertinoDialog(context: context, builder: (context){
            return CupertinoAlertDialog(
              title: Text('Logout'),
              content: Text('Are you sure?'),
              actions: [
                CupertinoButton(child: Text('Yes', style: TextStyle(color: CupertinoColors.systemGreen),), onPressed: (){
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>MyApp()));
                }),
                CupertinoButton(child: Text('No', style: TextStyle(color: CupertinoColors.destructiveRed),), onPressed: (){
                  Navigator.pop(context);
                })
              ],
            );
          });
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(child: Column(
          children: [
            Text('Homepage')
          ],
        )),
      ),
    );
  }
}
