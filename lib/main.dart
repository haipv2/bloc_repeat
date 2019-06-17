import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flt_bloc_repeat/blocs/application_bloc.dart';
import 'package:flt_bloc_repeat/blocs/bloc_provider.dart';
import 'package:flt_bloc_repeat/blocs/favorite_bloc.dart';
import 'package:flt_bloc_repeat/pages/home.dart';

Future<void> main() async {
//  debugPrintRebuildDirtyWidgets = true;
  return runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MyApp(),
      ),
    )
  );
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
