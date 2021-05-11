import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:memory_game/pages/start_game.dart';
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset('assets/brain_logo.json'),
            ),
           GestureDetector(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (_)=> StartGame()));
             },
             child: Container(
               color: Colors.blueGrey,
               height: 50,
                width: MediaQuery.of(context).size.width - 30 ,
               child: Center(
                 child: Text("Start Game",style: TextStyle(
                   fontSize: 30
                 ),),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
