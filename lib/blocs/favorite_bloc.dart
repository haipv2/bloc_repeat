import 'dart:async';
import 'dart:collection';

import 'package:flt_bloc_repeat/blocs/bloc_provider.dart';
import 'package:flt_bloc_repeat/models/movie_card.dart';
import 'package:rxdart/rxdart.dart';


class FavoriteBloc implements BlocBase {

  ///
  /// Unique list of all favorite movies
  ///
  final Set<MovieCard> _favorites = Set<MovieCard>();

  // ##########  STREAMS  ##############
  ///
  /// Interface that allows to add a new favorite movie
  ///
  BehaviorSubject<MovieCard> _favoriteAddController = new BehaviorSubject<MovieCard>();
  Sink<MovieCard> get inAddFavorite => _favoriteAddController.sink;

  ///
  /// Interface that allows to remove a movie from the list of favorites
  ///
  BehaviorSubject<MovieCard> _favoriteRemoveController = new BehaviorSubject<MovieCard>();
  Sink<MovieCard> get inRemoveFavorite => _favoriteRemoveController.sink;

  ///
  /// Interface that allows to get the total number of favorites
  ///
  BehaviorSubject<int> _favoriteTotalController = new BehaviorSubject<int>();
  Sink<int> get _inTotalFavorites => _favoriteTotalController.sink;
  Stream<int> get outTotalFavorites => _favoriteTotalController.stream;

  ///
  /// Interface that allows to get the list of all favorite movies
  ///
  BehaviorSubject<List<MovieCard>> _favoritesController = new BehaviorSubject<List<MovieCard>>();
  Sink<List<MovieCard>> get _inFavorites =>_favoritesController.sink;
  Stream<List<MovieCard>> get outFavorites =>_favoritesController.stream;

  ///
  /// Constructor
  ///
  FavoriteBloc(){
    _favoriteAddController.listen(_handleAddFavorite);
    _favoriteRemoveController.listen(_handleRemoveFavorite);
  }

  void dispose(){
    _favoriteAddController.close();
    _favoriteRemoveController.close();
    _favoriteTotalController.close();
    _favoritesController.close();
  }

  // ############# HANDLING  #####################

  void _handleAddFavorite(MovieCard movieCard){
    // Add the movie to the list of favorite ones
    _favorites.add(movieCard);

    _notify();
  }

  void _handleRemoveFavorite(MovieCard movieCard){
    _favorites.remove(movieCard);

    _notify();
  }

  void _notify(){
    // Send to whomever is interested...
    // The total number of favorites
    _inTotalFavorites.add(_favorites.length);

    // The new list of all favorite movies
    _inFavorites.add(UnmodifiableListView(_favorites));
  }
}
