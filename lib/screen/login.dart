import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landing_page/controller/model.dart';
import 'package:landing_page/controller/textfield.dart';
import 'package:landing_page/screen/reedemCode_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controller/httpHelp.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String status = "";

  void showLoadingDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ReedemCodePage(reedemCode: "FREETOBA", email: email,);
      },
    );
  }
  void showLoadingDialog2(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }
  bool checkValue(){
                          if(emailController.text == ""){
                            status = "Email could not be empty";
                            setState(() {
                              
                            }); return false;
                            print(status);
                          } else if(passwordController.text == ""){
                            status = "Password could not be empty";
                            setState(() {
                              
                            });return false;
                            print(status);
                          } else{
                            status = "";
                            setState(() {
                              
                            }); return true;
                            print("Success");
                          }
    }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: (width<height)?signUpMobile(height, width):signUpDesktop(height, width),
    );
  }

  Stack signUpMobile(double height, double width) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: Models.linearGradient
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
                  margin: EdgeInsets.symmetric(vertical: 35),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 700,
                  width: width*90/100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: SvgPicture.asset("assets/images/sign up.svg", width: 250,),
                      ),
                      Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(status, style: TextStyle(color: Colors.red),)),
                      SizedBox(height: 10,),
                
                      TextFieldCustom.TemplateTF(emailController, "Email"),
                      TextFieldCustom.TemplateTF(passwordController, "Password"),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: ()async{
                          
                        if (checkValue()==true){
                          showLoadingDialog2(context);
                          String emailValue=emailController.text;
                            String passwordValue=passwordController.text;
                            var response= await http.post(Uri.https(Helper.baseUrl,Helper.baseEndpoint+"login")
                            ,body:jsonEncode([emailValue,passwordValue]));
                            var code=response.statusCode;

                            if(code==200){
                              showLoadingDialog(context, emailValue);

                            } else{
                              setState(() {
                                status="Account not found!";
                              });
                              Navigator.of(context).pop();
                            }
                        }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width*3/10,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xff528DE7),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Login", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
          ),
        )
      ],
    );
  }

  Stack signUpDesktop(double height, double width) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: Models.linearGradient
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80*height/100,
                width: width*40/100,
                decoration: BoxDecoration(
                  color: const Color(0xff528DE7).withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset("assets/images/sign up.svg", width: width*3/10,)],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 80*height/100,
                width: width*35/100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),),
                    SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(status, style: TextStyle(color: Colors.red),)),
                      SizedBox(height: 10,),
                   
                    TextFieldCustom.TemplateTF(emailController, "Email"),
                    TextFieldCustom.TemplateTF(passwordController, "Password"),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () async{
                        
                        if (checkValue()==true){
                          showLoadingDialog2(context);
                          String emailValue=emailController.text;
                            String passwordValue=passwordController.text;
                            var response= await http.post(Uri.https(Helper.baseUrl,Helper.baseEndpoint+"login")
                            ,body:jsonEncode([emailValue,passwordValue]));
                            var code=response.statusCode;
                            var data=jsonDecode(response.body);
                            String emaill=data[1];

                            if(code==200){
                              showLoadingDialog(context, emaill);

                            } else{
                              setState(() {
                                status="Account not found!";
                              });
                              Navigator.of(context).pop();
                            }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width*3/10,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xff528DE7),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Login", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  
}