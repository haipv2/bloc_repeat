import 'package:flutter/material.dart';
import 'package:flt_bloc_repeat/blocs/bloc_provider.dart';
import 'package:flt_bloc_repeat/blocs/favorite_bloc.dart';
import 'package:flt_bloc_repeat/models/movie_card.dart';
import 'package:flt_bloc_repeat/widgets/favorite_widget.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Page'),
      ),
      body: StreamBuilder(
        stream: bloc.outFavorites,
        // Display as many FavoriteWidgets
        builder:
            (BuildContext context, AsyncSnapshot<List<MovieCard>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return FavoriteWidget(
                  data: snapshot.data[index],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
