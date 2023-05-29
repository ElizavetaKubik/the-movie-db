import 'package:flutter/material.dart';
import 'package:the_movie_db/widgets/movie_details/movie_delails_main_info_widget.dart';
import 'package:the_movie_db/widgets/movie_details/movie_delails_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('фильмы под накимто длинным названием'),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1),
        child: ListView(
          children: [
            MovieDetailsMainInfoWidget(),
            MovieDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
