import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Controls extends StatefulWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {

  Color selectedColor=Color.fromARGB(255, 27, 140, 251);

  double _value = 0.5;
  
  List<Color> colors = [Color.fromARGB(255, 246, 210, 0),Color.fromARGB(255, 253, 164, 2),Color.fromARGB(255, 242, 100, 0),Color.fromARGB(255, 241, 28, 20),Color.fromARGB(255, 135, 25, 152),Color.fromARGB(255, 90, 37, 153),Color.fromARGB(255, 68, 46, 156),Color.fromARGB(255, 40, 174, 113),Color.fromARGB(255, 41, 163, 62),Color.fromARGB(255, 148, 206, 0),Color.fromARGB(255, 27, 140, 251)];
  
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0,top: 12),
            child: Text('Mood Light',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  height: h/1.6,
                  child: SfSlider.vertical(
                    activeColor: selectedColor.withAlpha((255*_value).round()),
                    thumbIcon: CircleAvatar(backgroundColor: Colors.white,),
                    value: _value,
                    onChanged: (dynamic newValue){
                      setState(() {
                        _value = newValue;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: w-150),
                child: Image.asset('assets/bulb.png'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img.png',scale: 2.5,),
                Image.asset('assets/pow.png',scale: 2.5,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0,top: 10),
            child: Row(
              children: [
                for(var i in colors) hue(i)
              ],
            ),
          )
        ],
      )
    );
  }

  Widget hue(Color color)
  {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedColor=color;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 8,
          decoration: new BoxDecoration(
              color: color,
              shape:
              BoxShape.rectangle,
              borderRadius:
              BorderRadius.all(Radius.circular(8.0))

          ),
        ),
      ),
    );
  }

}
