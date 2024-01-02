import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:landing_page/controller/textfield.dart';
import 'package:http/http.dart' as http;
import 'package:landing_page/screen/login.dart';

class ReedemCodePage extends StatefulWidget {
  final String reedemCode;
  final String email;
  ReedemCodePage({required this.reedemCode, required this.email, super.key});

  @override
  State<ReedemCodePage> createState() => _ReedemCodePageState();
}

class _ReedemCodePageState extends State<ReedemCodePage> {
  final reedemController = TextEditingController();
  bool visibility = false;
  

  @override
  Widget build(BuildContext context) {
 
    String reedemCode = widget.reedemCode;
    String email = widget.email;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 500,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: (width>height)?width/4:20),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Stack(
              children: [
                Align(alignment: Alignment.topRight,
                child: IconButton(icon: Icon(Icons.close_rounded), onPressed: (){ Navigator.of(context).pop();
                Navigator.of(context).pop();
                //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
                },),),
               
                Align(
                  alignment: Alignment.center,
                  child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                  Text("Thank you for pre-registering!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SvgPicture.asset("assets/images/preregist_gift.svg", height: 150,),
                  SizedBox(height: 20,),
                  Text("Your redemption will be sent to your email", textAlign: TextAlign.center,),
                  TextFieldCustom.TemplateTF(reedemController,"Reedem Code"),
                  Visibility(
                    visible: visibility,
                    child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_rounded, size: 17, color: Colors.green,),
                        SizedBox(width: 5,),
                        Text("Reedem code succesfully applied!", style: TextStyle(color: Colors.green),)
                      ],
                    ),
                  )),
                  
                  InkWell(
                    onTap:(){ print(email);
                    setState(() {
                      visibility = true;
                    });
                    },
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff528DE7),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Apply Reedem Code", style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff528DE7),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      margin: EdgeInsets.only(top: 10),
                      child: Text("BUY 1 GET 2 NOW", style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),
                  )
                            ],
                          ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}