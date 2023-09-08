import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/utils/utils.dart';
import 'package:movies/features/widgets/popular_movie_widget.dart';
import 'package:movies/features/widgets/top_rated_movie_slider.dart';
import 'package:movies/features/widgets/upcoming_movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          children: [
            const PopularMovieSlider(),
            SizedBox(
              height: h / 40,
            ),
            const UpcomingMovieSlider(),
            SizedBox(
              height: h / 40,
            ),
            const TopRatedMovieSlider(),
          ],
        ),
      ),
    );
  }
}
