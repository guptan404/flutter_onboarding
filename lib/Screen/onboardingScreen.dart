import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Screen/Homepage/homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<Color> col = [Color.fromARGB(255, 253, 220, 203),Colors.white];
  List<String> title=['Relax and Control','Variety and Modes'];
  List<String> subtitle=['Smart Home controls at your own comfort.','Connect to almost every device vat your Smart Home.'];

  int i=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: col[i],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 200,
              decoration:  const BoxDecoration(
                color: Color.fromARGB(255, 30, 30, 30),
                borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  // bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  // bottomLeft: Radius.circular(40.0)),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.do_not_disturb_on_total_silence,color: i==0?Colors.blue:Colors.white,size: 13,),
                      SizedBox(width: 10,),
                      Icon(Icons.do_not_disturb_on_total_silence,color: i==1?Colors.blue:Colors.white,size: 13,),
                    ],
                  ),
                  SizedBox(height: 20,),
                   Text(
                    title[i],style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                  SizedBox(height: 20,),
                   Text(
                      subtitle[i],style: TextStyle(color: Colors.white,fontSize: 16),maxLines: 1,
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homepage()));
                        }, child: Text('SKIP',style: TextStyle(color: Colors.white,fontSize: 16))),
                        TextButton(onPressed: (){
                          if (i==0) {
                            setState(() {
                              i=1;
                            });
                          }
                          else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homepage()));
                          }
                        }, child: Text(i==0?'NEXT':'GET STARTED',style: TextStyle(color: Colors.blue,fontSize: 16)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
