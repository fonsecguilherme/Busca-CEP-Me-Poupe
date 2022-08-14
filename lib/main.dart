import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procura_cep/logic/navigation/navigation_cubit.dart';

import 'view/screens/root_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: const MaterialApp(
        title: 'BUSCA CEP - ME POUPE',
        debugShowCheckedModeBanner: false,
        home: RootScreen(),
      ),
    );
  }
}
