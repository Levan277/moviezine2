import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'text.dart';
import 'description.dart';
class TopRated extends StatelessWidget {

  final List topRated;

  const TopRated({Key? key, required this.topRated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Top Rated Movies',color: Colors.white,size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 270.0,

              child:ListView.builder(itemCount: topRated.length,
                  scrollDirection: Axis.horizontal ,
                  itemBuilder: (context, index){

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(topRated[index]['title'], topRated[index]['overview'],   'https://image.tmdb.org/t/p/w500'+ topRated[index]['poster_path'], topRated[index]['vote_average'].toString(), topRated[index]['release_date'])));
                      },
                      child: Container(
                        width: 140.0,
                        child: Column(
                          children: [
                            Container(
                              height: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path']),
                                  )
                              ),
                            ),
                            Container(
                              child: CustomText(text: topRated[index]['title']!=null?topRated[index]['title']:'Untitled',color: Colors.white,size: 15),
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

