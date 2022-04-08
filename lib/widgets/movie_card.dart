import 'package:flutter/material.dart';
import 'package:mozi_app/theme.dart';

class MovieCard extends StatelessWidget {
  late String moviePoster;
  late String movieTitle;

  MovieCard({
    required this.moviePoster,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultmargin,
      ),
      height: 306,
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 190,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original$moviePoster'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieTitle,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 18,
            width: 98,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Ratings.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
