import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/home/bloc/movie_bloc.dart';
import 'package:movies/features/movie_details/ui/movie_detail_screen.dart';
import 'package:movies/features/repos/movie_repo.dart';

class PopularMovieSlider extends StatefulWidget {
  const PopularMovieSlider({super.key});

  @override
  State<PopularMovieSlider> createState() => _PopularMovieSliderState();
}

class _PopularMovieSliderState extends State<PopularMovieSlider> {
  final MovieBloc movieBloc = MovieBloc();
  final MovieRepo movieRepo = MovieRepo();

  @override
  void initState() {
    movieBloc.add(PopularMovieInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<MovieBloc, MovieState>(
      bloc: movieBloc,
      listenWhen: (previous, current) => current is MovieActionState,
      buildWhen: (previous, current) => current is! MovieActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case MovieFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case PopularMovieFetchSuccessfulState:
            final successSate = state as PopularMovieFetchSuccessfulState;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Movies",
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: h / 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: successSate.popular.length,
                      itemBuilder: (context, index, pageView) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  title:
                                      "${successSate.popular[index].results![index].title}",
                                  vote:
                                      "${successSate.popular[index].results![index].voteAverage}",
                                  releaseDate:
                                      "${successSate.popular[index].results![index].releaseDate}",
                                  overview:
                                      "${successSate.popular[index].results![index].overview}",
                                  image: Image.network(
                                    "${movieRepo.imageUrl}${successSate.popular[index].results![index].backdropPath}",
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: h * 0.5,
                              width: w * 0.6,
                              child: Image.network(
                                  "${movieRepo.imageUrl}${successSate.popular[index].results![index].posterPath}"),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: h * 0.4,
                        autoPlay: true,
                        viewportFraction: 0.55,
                        enlargeCenterPage: true,
                        pageSnapping: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
