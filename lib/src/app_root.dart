import 'package:currency_converter/blocs/currency_cubit.dart';
import 'package:currency_converter/screens/currency_changer_screen.dart';
import 'package:currency_converter/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CurrencyCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:StartScreen(),
      ),
    );
  }
}