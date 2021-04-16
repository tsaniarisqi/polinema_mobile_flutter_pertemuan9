import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan9/models/movie.dart';

// untuk menampilkan gambar secara fullscreen
class FullscreenImage extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  FullscreenImage(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/Seb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                path,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
