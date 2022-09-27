import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Screen/Controls/controls.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {

  double w=0,h=0;

  int ind=1;

  ScrollController scrollController = ScrollController();

  List<String> imgs = ['assets/a1.png','assets/a2.png','assets/a4.png','assets/a5.png','assets/info.png','assets/a8.png'];
  List<String> tags=["Washing Machine","TV","AC","Lamp","Mood Light","Fan"];

  @override
  void initState() {
    // TODO: implement initState

    scrollController.addListener(() {
      if(scrollController.position.pixels>274)
      {
        // scrollController.animateTo(412,duration: Duration(seconds: 1),curve: Curves.easeIn);
        if(ind!=2)
          {
            setState(() {
              ind=2;
            });
          }
      }
      else if(scrollController.position.pixels>138)
        {
          // scrollController.animateTo(200,duration: Duration(seconds: 1),curve: Curves.easeIn);
          if(ind!=1)
          {
            setState(() {
              ind=1;
            });
          }
        }
      else if(scrollController.position.pixels>0)
      {
        // scrollController.animateTo(0,duration: Duration(seconds: 1),curve: Curves.easeIn);
        if(ind!=0)
        {
          setState(() {
            ind=0;
          });
        }
      }
      print(scrollController.position.pixels);
      print(ind);
    });

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      scrollController.jumpTo(200);
    });
  }

  List<String> rooms = ['Bedroom','Study Room','Washroom'];

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
        actions: [
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(var i in rooms) boxLarge(text: i)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Devices',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ],
                ),
              ),
              Column(
                children: [
                  for(int i=0;i<=imgs.length-1;i+=2) Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        boxSmall(img: imgs[i]),
                        boxSmall(img: imgs[i+1])
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget boxLarge({String text=""})
  {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        width: w/1.5,
        height: 140,
        decoration:  const BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(20))
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)
                )),
            elevation: 15,
            color: ind==rooms.indexOf(text)?Color.fromARGB(255, 44, 44, 44):Color.fromARGB(
                137, 44, 44, 44),
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
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('5 Total Devices',style: TextStyle(color: Colors.white),),
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('3 Active Devices',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget boxSmall({String text="",String img=""})
  {
    return GestureDetector(
      onTap: (){
        if(img=='assets/info.png')
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Controls()));
          }
      },
      child: Container(
        width: w/2.1,
        height: (w/2.1),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)
                )),
            elevation: 15,
            color: Color.fromARGB(255, 44, 44, 44),
            child: text!=""?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,style: TextStyle(color: Colors.white),),
            ):Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(tags[imgs.indexOf(img)],style: TextStyle(color: Colors.white),maxLines: 1,textAlign:TextAlign.center,overflow: TextOverflow.ellipsis,)),
                      Image.asset('assets/pow.png',scale: 3,)
                    ],
                  ),
                ),
                Image.asset(img,color: Colors.blue,),
                SizedBox(height: 10,),
              ],
            )
        ),
      ),
    );
  }

}
