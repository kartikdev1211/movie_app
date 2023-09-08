import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/movie_details/bloc/movie_detail_bloc.dart';
import 'package:movies/features/utils/utils.dart';

class MovieDetailScreen extends StatefulWidget {
  final String title;
  final Image image;
  final String overview;
  final String releaseDate;
  final String vote;
  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.overview,
    required this.releaseDate,
    required this.vote,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final MovieDetailBloc movieDetailBloc = MovieDetailBloc();
  @override
  void initState() {
    movieDetailBloc.add(MovieDetailInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Utils.scaffoldBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackButton(
              color: Colors.white,
            ),
            backgroundColor: Utils.scaffoldBgColor,
            expandedHeight: h * 0.5,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title,
                style: GoogleFonts.belleza(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: widget.image,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  Text(
                    widget.overview,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Release Date: ",
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.releaseDate,
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Rating: ",
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                widget.vote,
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
