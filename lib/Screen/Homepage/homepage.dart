import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding/Screen/Homepage/rooms.dart';

import 'info.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double w=0,h=0;
  int i=0;
  List<String> s=["Ground","First","Second","Balcony","Garden"];
  List<String> imgs = ['assets/a1.png','assets/a2.png','assets/a4.png','assets/a5.png','assets/a8.png'];
  List<String> tags=["Washing Machine","TV","AC","Lamp","Fan"];
  List<String> imgQ = ['assets/cleaning.png','assets/rise.png'];
  List<String> tagT=["Cleaning","Rise and Shine"];
  List<String> tagS=["10 AM Scheduled","7 AM Scheduled"];
  String bottomInd="assets/home1.png";

  Map<String,String> bottom = {
    "assets/home1.png":"assets/homeSel.png",
    "assets/info.png":"assets/infoSel.png",
    "assets/profile.png":"assets/profileSel.png",
  };

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
        leading: Image.asset('assets/home.png',scale: 2,),
        actions: [
          Image.asset('assets/notif.png',scale: 2,)
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 18, 18, 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      for(var i in s) boxSmall(text: i)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
               Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Rooms',style: TextStyle(color: Colors.white,fontSize: 20)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                child: Row(
                  children: [
                    boxMed(text: "Master Bedroom",subText: "9 devices"),
                    boxMed(text: "Study Room",subText: "5 devices")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Row(
                  children: [
                    boxMed(text: "Washroom 2",subText: "7 devices"),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Rooms()));
                      },
                        child: boxMed(text: "Add new room",subText: ""))
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Active Devices',style: TextStyle(color: Colors.white,fontSize: 20)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      for(var i in imgs) boxSmall(img: i)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Quick Actions',style: TextStyle(color: Colors.white,fontSize: 20)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      for(int i=0;i<imgQ.length;i++) boxLarge(text: tagT[i],subText: tagS[i],img: imgQ[i])
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(onClosing: () {  }, builder: (BuildContext context) {
        return Container(
          height: 55,
          color: Color.fromARGB(255, 44, 44, 44),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 30,right: 30,bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(String i in bottom.keys)
                  GestureDetector(
                      onTap: (){
                        bottomInd=i;
                        setState(() {

                        });
                        if(bottomInd=="assets/home1.png")
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homepage()));
                        }
                        else if(bottomInd=="assets/info.png")
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Info()));
                        }
                      },
                      child: Image.asset(i,scale: 3.5,color: bottomInd==i?Colors.blue:Colors.white,))
              ],
            ),
          ),
        );
      },

      ),
    );
  }
  Widget boxSmall({String text="",String img=""})
  {
    return GestureDetector(
      onTap: (){
        i=s.indexOf(text);
        setState(() {

        });
      },
      child: Container(
        width: w/4.0,
        height: text!=""?80:110,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)
                )),
          elevation: 15,
          color: i==s.indexOf(text)?Color.fromARGB(255, 44, 44, 44):Color.fromARGB(255, 30, 30, 30),
          child: text!=""?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: Colors.white),),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/power.png',scale: 2,)
                ],
              ),
              Image.asset(img),
              SizedBox(height: 10,),
              Center(child: Text(tags[imgs.indexOf(img)],style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,))
            ],
          )
        ),
      ),
    );
  }

  Widget boxMed({String text="",String subText="",String img=""})
  {
    return Container(
      width: w/2.1,
      height: 140,
      decoration:  const BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(20))
        ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)
        )),
          elevation: 15,
          color: Color.fromARGB(255, 44, 44, 44),
          child: text!=""?Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(text,style: TextStyle(color: Colors.white,fontSize: 18),overflow: TextOverflow.ellipsis,),
                  ],
                ),
                SizedBox(height: subText!=""?8:50,),
                subText!=""?Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(subText,style: TextStyle(color: Colors.white),),
                  ],
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 40,)
                  ],
                ),
              ],
            ),
          ):Image.asset(img)
      ),
    );
  }

  Widget boxLarge({String text="",String subText="",String img=""})
  {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        width: w/1.7,
        height: 140,
        decoration:  const BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(20))
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)
                )),
            elevation: 15,
            color: Color.fromARGB(255, 44, 44, 44),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(text,style: TextStyle(color: Colors.white,fontSize: 18),overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                  SizedBox(height: subText!=""?8:50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(subText,style: TextStyle(color: Colors.white),),
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(img,scale: 2.5,color: Colors.white,)
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
