import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mozi_app/theme.dart';
import 'package:mozi_app/widgets/movie_genre.dart';
import 'package:http/http.dart' as http;

class MovieDetail extends StatelessWidget {
  late String uuid;
  late Map<String, dynamic> movieDetails;
  late List<Map<String, dynamic>> genreData = [];
  String apikey = 'cc08cac266d32fe36d2f23005ea0b732';

  MovieDetail(this.uuid);

  Future getMovieDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$uuid?api_key=$apikey&language=en-US'),
      );
      movieDetails = (jsonDecode(response.body) as Map<String, dynamic>);
      List genre = movieDetails["genres"];
      genre.forEach((element) {
        genreData.add(element);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: const Color(0xff1D2027),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: defaultmargin,
            ),
            child: const Icon(
              Icons.bookmark_outline,
              size: 22,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Details Movie',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget body() {
      return FutureBuilder(
          future: getMovieDetails(),
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
            return ListView(
              children: [
                Container(
                  height: 370,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultmargin,
                    left: defaultmargin,
                    right: defaultmargin,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/original' +
                              movieDetails['poster_path'],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: defaultmargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieDetails["original_title"],
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Release Date:  ' + movieDetails["release_date"],
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                                color: const Color(0xffBABFC9),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Star 5.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            (movieDetails["vote_average"]).toString(),
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              color: const Color(0xffBABFC9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: defaultmargin,
                  ),
                  height: 29,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: genreData.length,
                    itemBuilder: (context, index) {
                      return MovieGenre(genre: "${genreData[index]['name']}");
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: defaultmargin,
                    left: defaultmargin,
                    right: defaultmargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Storyline',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        movieDetails["overview"],
                        style: secondaryTextStyle.copyWith(fontWeight: regular),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: defaultmargin,
                    right: defaultmargin,
                    bottom: defaultmargin,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Watch Movie',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: header(),
      body: body(),
    );
  }
}
