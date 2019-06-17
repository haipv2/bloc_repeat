import 'package:flutter/material.dart';
import 'package:flt_bloc_repeat/blocs/bloc_provider.dart';
import 'package:flt_bloc_repeat/blocs/favorite_bloc.dart';
import 'package:flt_bloc_repeat/models/movie_card.dart';
import 'package:flt_bloc_repeat/widgets/movie_details_widget.dart';

class MovieDetailsContainer extends StatefulWidget {
  MovieDetailsContainer({
    Key key,
  }) : super(key: key);

  @override
  MovieDetailsContainerState createState() => MovieDetailsContainerState();
}

class MovieDetailsContainerState extends State<MovieDetailsContainer> {
  MovieCard _movieCard;

  set movieCard(MovieCard newMovieCard) {
    setState(() {
      _movieCard = newMovieCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_movieCard == null)
        ? Center(
            child: Text('Click on a movie to see the details...'),
          )
        : MovieDetailsWidget(
            movieCard: _movieCard,
            boxFit: BoxFit.contain,
            favoritesStream: BlocProvider.of<FavoriteBloc>(context).outFavorites,
          );
  }
}
