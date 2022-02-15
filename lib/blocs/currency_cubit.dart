import 'package:bloc/bloc.dart';
import 'package:currency_converter/dio/dio_services.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit() : super(CurrencyInitial());


  static CurrencyCubit get(context) => BlocProvider.of(context);



  CurrencyHub? currencyHub;


  convertCurrency(String from , double amount ,String to){
    emit(CurrencyLoadingState());
    DioHelper.getData(
        query:
        {
          'from':from,
          'amount':amount,
          'to': to
        }
    ).then((value) {
      currencyHub = CurrencyHub.fromJson(value.data);
      print(currencyHub?.approxResult);
      emit(CurrencySuccessState());

    }).catchError((error){
      print(error.toString());
      emit(CurrencyErrorState());
    });
  }


}