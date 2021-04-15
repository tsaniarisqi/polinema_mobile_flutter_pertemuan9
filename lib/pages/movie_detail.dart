import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan9/models/movie.dart';
import 'package:pertemuan9/pages/fullscreenimage.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

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
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: GestureDetector(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.network(
                          path,
                          height: 200,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return FullscreenImage(movie);
                        }));
                      }),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Icon(
                                Icons.star_rate,
                                color: Colors.yellow[300],
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              movie.voteAverage.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Icon(Icons.calendar_today_sharp,
                                color: Colors.red[300]),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              movie.releaseDate,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Overview',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                Container(
                  child: Text(movie.overview,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify),
                  padding: EdgeInsets.only(left: 16, right: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
