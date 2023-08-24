import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/services/api_services.dart';
import 'package:movies/utils/utils.dart';
import 'package:movies/widgets/top_rated_slider.dart';
import 'package:movies/widgets/popular_slider.dart';
import 'package:movies/widgets/upcoming_movie_slider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Utils.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Movie Stand",
          style: GoogleFonts.aBeeZee(color: Colors.red, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: h / 40,
              ),
              const PopularSlider(),
              SizedBox(
                height: h / 40,
              ),
              Text(
                "Top Rated Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: h / 40,
              ),
              const TopRatedSlider(),
              SizedBox(
                height: h / 40,
              ),
              Text(
                "Upcoming Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: h / 40,
              ),
              const UpcomingMovieSlider()
            ],
          ),
        ),
      ),
    );
  }
}
