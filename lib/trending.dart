import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviezine2/description.dart';
import 'text.dart';
import 'description.dart';
class TrendingMovies extends StatelessWidget {

  final List trendMovies;

  const TrendingMovies({Key? key, required this.trendMovies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Trending Movies',color: Colors.white,size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270.0,

            child:ListView.builder(itemCount: trendMovies.length,
            scrollDirection: Axis.horizontal ,
            itemBuilder: (context, index){

              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(trendMovies[index]['title'], trendMovies[index]['overview'],   'https://image.tmdb.org/t/p/w500'+trendMovies[index]['poster_path'], trendMovies[index]['vote_average'].toString(), trendMovies[index]['release_date'])));
                },
                child: Container(
                  width: 140.0,
                  child: Column(
                    children: [
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+trendMovies[index]['poster_path']),
                          )
                        ),
                      ),
                      Container(
                        child: CustomText(text: trendMovies[index]['title']!=null?trendMovies[index]['title']:'Untitled',color: Colors.white,size: 15),
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
