import 'package:flutter/material.dart';
import 'package:moviezine2/text.dart';

class Description extends StatelessWidget {

final String name, description,posterurl,vote,launchOn;

Description(this.name, this.description,this.posterurl,this.vote,this.launchOn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: CustomText(text: name!=null?name:'Untitled',color: Colors.white,size: 15),
            ),
            Container(
              padding: EdgeInsets.only(left:11),
              child: CustomText(text: "Releasing on - "+launchOn,color: Colors.white,size: 10),

            ),
            Row(
              children: [
                Container(
                  height:200,
                  width: 100,
                  margin:EdgeInsets.all(5),
                  child: Image.network(posterurl),


                  ),
               Expanded(
                 child: Container(
                   child: CustomText(
                     text: description, size: 15,color: Colors.white,),

                   ),
               ),

              ],
            ),
          ],
        ),

      ),
    );
  }
}
