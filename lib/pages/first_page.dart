import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mozi_app/pages/movie_detail.dart';
import 'package:mozi_app/theme.dart';
import 'package:mozi_app/widgets/movie_card.dart';
import 'package:mozi_app/widgets/movie_tile.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatelessWidget {
  late String uuid = "";
  List<Map<String, dynamic>> popularMovies = [];
  List<Map<String, dynamic>> popularTvSeries = [];
  String apiKey = 'cc08cac266d32fe36d2f23005ea0b732';

  Future getPopularMovies() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1'),
      );

      List data =
          (jsonDecode(response.body) as Map<String, dynamic>)['results'];
      data.forEach((element) {
        popularMovies.add(element);
      });
    } catch (e) {
      print(e);
    }
  }

  Future getTvSeries() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=1'),
      );
      List data =
          (jsonDecode(response.body) as Map<String, dynamic>)['results'];

      data.forEach((element) {
        popularTvSeries.add(element);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 14),
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Profile.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Alex Samm',
                          style: primaryTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 19,
                    width: 19,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/Notificon.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget topMovie() {
      return FutureBuilder(
          future: getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  'Loading',
                  style: primaryTextStyle,
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(
                top: defaultmargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: defaultmargin,
                      right: defaultmargin,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Movie',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          'See More',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 306,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              uuid = "${popularMovies[index]["id"]}";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetail(uuid),
                                ),
                              );
                            },
                            child: MovieCard(
                              moviePoster:
                                  "${popularMovies[index]["poster_path"]}",
                              movieTitle: "${popularMovies[index]["title"]}",
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          });
    }

    Widget tvSeries() {
      return FutureBuilder(
        future: getTvSeries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Loading',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(
              top: defaultmargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: defaultmargin,
                    right: defaultmargin,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tv Series',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'See More',
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return MovieTile(
                        genre: 'Drama',
                        movieTitle: "${popularTvSeries[index]["name"]}",
                        moviePoster: "${popularTvSeries[index]["poster_path"]}",
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          topMovie(),
          tvSeries(),
        ],
      ),
    );
  }
}
