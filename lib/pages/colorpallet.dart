import 'package:flutter/material.dart';
import 'dart:math';

class ColorPallet extends StatefulWidget {
  const ColorPallet({Key? key}) : super(key: key);

  @override
  _ColorPalletState createState() => _ColorPalletState();
}

class _ColorPalletState extends State<ColorPallet> {
  @override

  Random r1 = Random();

  List colors = [
    Colors.black,
    Colors.orange,
    Colors.amber,
    Colors.indigo,
    Colors.red,
    Colors.grey,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.black12,
    Colors.teal,
    Colors.cyan,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.yellowAccent,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFD8E6F4),
                    ]
                )
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Color Palette\nGenerator",textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF3BB3F9), fontSize: 30, fontWeight: FontWeight.w700),),
                Column(
                  children: List.generate(6, (index) => Container(
                    height: MediaQuery.of(context).size.height*0.09,
                    width: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                      color: colors[r1.nextInt(16)],
                      borderRadius: radiusFinder(index),
                    ),
                  )),
                ),
                OutlinedButton(
                  onPressed: (){
                    setState(() {});
                  },
                  child: const Text("Generate", style: TextStyle(color: Color(0xFF3BB3F9), fontSize: 30, fontWeight: FontWeight.w700),),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF3BB3F9), width: 3,),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  radiusFinder(int n){
    if(n == 0) {return const BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(20));}
    else if( n == 5) {return const BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft: Radius.circular(20));}
    else { BorderRadius.circular(0);}
  }
}