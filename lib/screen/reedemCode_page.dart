import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import '../controller/textfield.dart';
import 'package:http/http.dart' as http;
import '../screen/login.dart';
import 'dart:convert';
import '../controller/httpHelp.dart';
import 'package:url_launcher/url_launcher.dart';
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
  Color statusColor = Colors.green;
  Icon statusIcon = Icon(Icons.check_circle_outline_rounded, size: 17, color: Colors.green,);
  String status="";
  

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
                
                  
                  TextFieldCustom.TemplateTF(reedemController,"Reedem Code"),
                  Text(status, style: TextStyle(color: statusColor, fontSize: 12),),
                  
                  InkWell(
                    onTap:()async{ 
                     var reedemValue = reedemController.text;
                     print(email);print(reedemValue);
                      var response= await http.post(Uri.https(Helper.baseUrl,Helper.baseEndpoint+"validateRedeemCode")
                      ,body:jsonEncode({"email":"$email","redeem":"$reedemValue"}
));
                      var code=response.statusCode;
                      var data=jsonDecode(response.body);
                      if(code==200){
                        setState(() {
                          print("sukess");
                        // statusIcon=Icon(null);
                          int hasil=data[1];
                          if(hasil==-1){
                            status = "Reedem code have been used or invalid";
                            statusColor= Colors.red;
                          } else if(hasil==0){
                            status = "Reedem code have been expired";
                            statusColor= Colors.red;
                          } else{
                            status = "Reedem code succes!";
                            statusColor= Colors.green;
                          }
                
                          
                          // statusIcon = Icon(Icons.check_circle_outline_rounded, size: 17, color: Colors.green,);
                        // visibility = true;
                      });}
                      else{
                        setState(() {
                          // visibility = false;
                          // statusIcon=Icon(null);
                          status="something wrong with server";
                          statusColor= Colors.red;
                        });
                      }
                    
                    },
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff528DE7),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Apply Reedem Code", style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),
                  ),
                  InkWell(
                    onTap: ()async {
                    String url = 'payment-links/1704897712581';
                    await launchUrl(Uri(
                      scheme: "https",
                      host: 'app.midtrans.com',
                      path: url,
                    ));
                  },
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
                  ),
                  SizedBox(height: 10,),
                  Text("Your redemption will be sent to your email", textAlign: TextAlign.center,),
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