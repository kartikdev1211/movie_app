import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/home/bloc/movie_bloc.dart';
import 'package:movies/features/movie_details/ui/movie_detail_screen.dart';
import 'package:movies/features/repos/movie_repo.dart';

class TopRatedMovieSlider extends StatefulWidget {
  const TopRatedMovieSlider({super.key});

  @override
  State<TopRatedMovieSlider> createState() => _TopRatedMovieSliderState();
}

class _TopRatedMovieSliderState extends State<TopRatedMovieSlider> {
  final MovieBloc movieBloc = MovieBloc();
  final MovieRepo movieRepo = MovieRepo();

  @override
  void initState() {
    movieBloc.add(TopRatedMovieInitialFetchEvent());
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
          case TopRatedMovieFetchinSuccessfulState:
            final successSate = state as TopRatedMovieFetchinSuccessfulState;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Rated Movies",
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: h * 0.2,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: successSate.topRated.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    title:
                                        "${successSate.topRated[index].results![index].title}",
                                    vote:
                                        "${successSate.topRated[index].results![index].voteAverage}",
                                    releaseDate:
                                        "${successSate.topRated[index].results![index].releaseDate}",
                                    overview:
                                        "${successSate.topRated[index].results![index].overview}",
                                    image: Image.network(
                                      "${movieRepo.imageUrl}${successSate.topRated[index].results![index].backdropPath}",
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
                                width: w * 0.3,
                                child: Image.network(
                                    "${movieRepo.imageUrl}${successSate.topRated[index].results![index].posterPath}"),
                              ),
                            ),
                          ),
                        );
                      },
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
