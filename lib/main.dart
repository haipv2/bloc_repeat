import 'package:flutter/material.dart';

import 'blocs/FavoriteBloc.dart';
import 'blocs/application_bloc.dart';
import 'blocs/bloc_provider.dart';

Future<void> main() async {
  return runApp(
    BlocProvider<ApplicationBloc>(
        bloc: ApplicationBloc(),
        child: BlocProvider<FavoriteBloc> (
          bloc: FavoriteBloc(),
          child: MyApp(),
        )),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
