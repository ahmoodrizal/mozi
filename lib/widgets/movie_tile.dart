import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mozi_app/theme.dart';

class MovieTile extends StatelessWidget {
  late String genre;
  late String moviePoster;
  late String movieTitle;

  MovieTile({
    required this.genre,
    required this.movieTitle,
    required this.moviePoster,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultmargin,
        bottom: 24,
        right: defaultmargin,
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            child: Row(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original' + moviePoster),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  genre,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 4,
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
          ),
        ],
      ),
    );
  }
}
