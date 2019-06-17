import 'package:flutter/material.dart';
import 'package:flt_bloc_repeat/blocs/bloc_provider.dart';
import 'package:flt_bloc_repeat/blocs/movie_catalog_bloc.dart';
import 'package:flt_bloc_repeat/pages/list.dart';
import 'package:flt_bloc_repeat/pages/list_one_page.dart';
import 'package:flt_bloc_repeat/widgets/favorite_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Movies')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Movies List'),
              onPressed: () {
                _openPage(context);
              },
            ),
            FavoriteButton(child: Text('Favorite Movies'),),
            RaisedButton(
              child: Text('One Page'),
              onPressed: () {
                _openOnePage(context);
              },
            ),
          ],
        ),
      ),
    );
  }


  void _openPage(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<MovieCatalogBloc>(
        bloc: MovieCatalogBloc(),
        child: ListPage(),
      );
    }));
  }

  void _openOnePage(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<MovieCatalogBloc>(
        bloc: MovieCatalogBloc(),
        child: ListOnePage(),
      );
    }));
  }
}
