import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landing_page/controller/model.dart';
import 'package:landing_page/screen/login.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        actions: [Container(
          margin: EdgeInsets.only(right:width/40),
          child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn()));}, child: Text("Login")),
        ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 2.0,
          ),
        ),
        elevation: 2,
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: Models.linearGradient
            ),
          ),
          Container(
            alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              gradient: Models.linearGradient),
          child: SingleChildScrollView(
               child: (width > 800)
            ?Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Models.InfoContainer(width, height, "Sign Up Now and Get Exclusive Rewards!", "Sign up now to grab a redeem code and unlock dual premium access for two apps with a single payment. Get full access to Bicara AI and TOBA APP. Limited, only for 7 days", "assets/images/about_app.svg", context),
                    SvgPicture.asset("assets/images/Gift.svg", width: 3*width/10,)
                  ],
                )
            : Column(
              children: [
                SizedBox(height: 5,),
                SvgPicture.asset("assets/images/Gift.svg", width: width*7/10,),
                Models.InfoContainer(width, height, "Sign Up Now and Get Exclusive Rewards!", "Sign up now and grab a redeem code to unlock dual premium access for two apps with a single payment! Get full access to Bicara AI and TOBA APP. Limited, only for 7 days", "assets/images/about_app.svg", context),
              ],
            ))
        ),]
      )
    );
  }
}