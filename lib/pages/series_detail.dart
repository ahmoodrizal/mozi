import 'package:flutter/material.dart';
import 'package:mozi_app/theme.dart';
import 'package:mozi_app/widgets/movie_genre.dart';

class SeriesDetail extends StatelessWidget {
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

    Widget moviePoster() {
      return Container(
        height: 370,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(
                'assets/Pict Movieposter.png',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget movieInfo() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: defaultmargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Behind Her Eyes',
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
                    'Director:' + ' Erik Richter Strand |',
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
                  '4.9',
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
      );
    }

    Widget movieGenre() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: defaultmargin,
            ),
            MovieGenre(genre: 'Drama'),
            MovieGenre(genre: 'Supernatural Fiction'),
          ],
        ),
      );
    }

    Widget storyline() {
      return Container(
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
              'Adele is a Scottish heiress whose extremely wealthy family owns estates and grounds. When she was a teenager.',
              style: secondaryTextStyle.copyWith(fontWeight: regular),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    Widget actionButton() {
      return Container(
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
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: header(),
      body: ListView(
        children: [
          moviePoster(),
          movieInfo(),
          movieGenre(),
          storyline(),
          actionButton(),
        ],
      ),
    );
  }
}
