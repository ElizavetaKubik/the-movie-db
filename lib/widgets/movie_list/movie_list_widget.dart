import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/styles.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/widgets/elements/radial_percent_widget.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.temp,
      title: 'ira',
      time: '12.12.2012',
      description: 'something',
    ),
    Movie(
      id: 2,
      imageName: AppImages.temp,
      title: 'petya',
      time: '12.12.2012',
      description: 'something',
    ),
    Movie(
      id: 3,
      imageName: AppImages.temp,
      title: 'petyara',
      time: '12.12.2012',
      description: 'something',
    ),
    Movie(
      id: 4,
      imageName: AppImages.temp,
      title: 'pentagon',
      time: '12.12.2012',
      description: 'something',
    ),
    Movie(
      id: 5,
      imageName: AppImages.temp,
      title: 'akakiy',
      time: '12.12.2012',
      description: 'something',
    ),
  ];

  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies.toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchMovies);
    _filteredMovies = _movies.toList();
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('main_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 60),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: const TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        onTap: () {
                          _onMovieTap(index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: AppTextFieldStyle.movieSearchTextFieldStyle,
            controller: _searchController,
          ),
        ),
        // const RadialPercentWidget(
        //   percent: 0.72,
        //   fillColor: AppColors.mainDakrBlue,
        //   lineColor: Colors.green,
        //   freeColor: Colors.yellow,
        //   lineWidth: 5,
        //   child: Center(
        //     child: Text(
        //       '72%',
        //       style: TextStyle(color: Colors.white, fontSize: 20),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
