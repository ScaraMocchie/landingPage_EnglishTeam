import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class ReedemCodePage extends StatelessWidget {
  final String reedemCode;
  const ReedemCodePage({required this.reedemCode,super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: (height>800)?150:120, horizontal: (width>height)?width/4:20),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Align(alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.close_rounded), onPressed: (){ Navigator.of(context).pop();},),),
              Align(
                alignment: Alignment.center,
                child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                Text("Thank you for pre-registering!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SvgPicture.asset("assets/images/preregist_gift.svg", height: 150,),
                SizedBox(height: 20,),
                Text("Your redemption code is:"),
                Container(
                  padding: EdgeInsets.all(5),
                  width: (width>=440)?400: width*80/100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(reedemCode),
                      IconButton(onPressed: ()async{
                        await Clipboard.setData(ClipboardData(text: reedemCode));
                      }, icon: Icon(Icons.copy_all_rounded))
                    ],
                  ),
                )
                          ],
                        ),
              ),
            ],
          )
        ),
      ),
    );
  }
}