// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movies/models/top_rated.dart';
import 'package:movies/screens/movie_detail_screen.dart';
import 'package:movies/services/api_services.dart';

class TopRatedSlider extends StatelessWidget {
  const TopRatedSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return FutureBuilder<TopRated>(
      future: apiServices.getTopRatedMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: h * 0.2,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            overview:
                                "${snapshot.data!.results![index].overview}",
                            releaseDate:
                                "${snapshot.data!.results![index].releaseDate}",
                            vote:
                                "${snapshot.data!.results![index].voteAverage}",
                            title: "${snapshot.data!.results![index].title}",
                            image: Image.network(
                              "${apiServices.imageUrl}${snapshot.data!.results![index].backdropPath}",
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
                            "${apiServices.imageUrl}${snapshot.data!.results![index].posterPath}"),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
