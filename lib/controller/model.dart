import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screen/signup.dart';

class Models {
  static var linearGradient = LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft,colors: [
                const Color(0xff528DE7),
                const Color(0xff20BCDA),
                const Color(0xff1CC2D9),
                const Color(0xff0FD3D5),
                const Color(0xff0FD3D5)
        ]);

  static Container InfoContainer(
      double width, double height, String title, String content, String image, context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(20),
      width: (width > 800)?width*6/10:width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: (width > 800)?CrossAxisAlignment.start:CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: (width > 800)?TextAlign.start:TextAlign.center,
            style: TextStyle(fontSize: (width > 800)?40:25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 25,),
          SizedBox(width: (width > 800)?width*2.1/5:width,
          child: Text(
            content,
            textAlign: (width > 800)?TextAlign.start:TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: (width > 800)?20:15),
          ),),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));},
           style: ButtonStyle(),
           child: Text("Sign Up for Presale", style: TextStyle(color: const Color(0xff528DE7), fontWeight: FontWeight.bold,),) )
          
        ],
      ),
    );
  }
}
