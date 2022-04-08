import 'package:flutter/material.dart';
import 'package:mozi_app/theme.dart';

class MovieGenre extends StatelessWidget {
  late String genre;

  MovieGenre({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 12,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      height: 29,
      decoration: BoxDecoration(
        color: const Color(0xff252932),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          genre,
          style: primaryTextStyle.copyWith(
            color: const Color(0xffB2B5BB),
            fontWeight: regular,
          ),
        ),
      ),
    );
  }
}
