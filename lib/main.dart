
import 'package:flutter/material.dart';
import 'text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'trending.dart';
import 'toprated.dart';
import 'tv.dart';
//import 'package:google_fonts/google_fonts.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),

    );
  }
}

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];
  List topRatedMovies = [];
  List upcomingMovies = [];
  String apiKey = "c64c20949dac8c3445f8c8686b09a181";
  String tokenAccess = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjRjMjA5NDlkYWM4YzM0NDVmOGM4Njg2YjA5YTE4MSIsInN1YiI6IjYyMDA0OWYzYTg4NTg3MDA5NWU0MTU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y_FGCVoNFcipfb7W0pk6flXa_BAY185oPSG_DBuZurk";
  @override
  void initState(){
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, tokenAccess),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingMovieMap = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map UpcomingMoviesMap = await tmdbWithCustomLogs.v3.trending.getTrending();



   setState(() {
     trendingMovies = trendingMovieMap['results'];
     topRatedMovies = topRatedResult['results'];
     upcomingMovies = UpcomingMoviesMap['result'];
   });
    print(upcomingMovies);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(text: 'MovieZine',color: Colors.white,size: 26),
      ),
      body: ListView(
        children: [

          TopRated(topRated: topRatedMovies,),
          TrendingMovies(trendMovies: trendingMovies,),

        ],
      ),
    );
  }
}
