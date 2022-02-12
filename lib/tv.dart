import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'text.dart';
class TvShows extends StatelessWidget {

  final List tv;

  const TvShows({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Upcoming Movies',color: Colors.white,size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 270.0,

              child:ListView.builder(itemCount: tv.length,
                  scrollDirection: Axis.horizontal ,
                  itemBuilder: (context, index){

                    return GestureDetector(
                      onTap: (){
                        //define later
                      },
                      child: Container(
                        width: 140.0,
                        child: Column(
                          children: [
                            Container(
                              height: 200.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']),
                                  )
                              ),
                            ),
                            Container(
                              child: CustomText(text: tv[index]['original_name']!=null?tv[index]['original_name']:'Untitled',color: Colors.white,size: 15),
                            )
                          ],
                        ),
                      ),
                    );
                  }

              )
          ),

        ],
      ),
    );
  }
}
