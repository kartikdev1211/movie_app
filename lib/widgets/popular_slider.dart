import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/movie_detail_screen.dart';
import 'package:movies/services/api_services.dart';

class PopularSlider extends StatelessWidget {
  const PopularSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: apiServices.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index, pageView) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          title: "${snapshot.data!.results![index].title}",
                          vote: "${snapshot.data!.results![index].voteAverage}",
                          releaseDate:
                              "${snapshot.data!.results![index].releaseDate}",
                          overview:
                              "${snapshot.data!.results![index].overview}",
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
                      width: w * 0.6,
                      child: Image.network(
                          "${apiServices.imageUrl}${snapshot.data!.results![index].posterPath}"),
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
