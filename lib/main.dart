import 'package:currency_converter/src/app_root.dart';
import 'package:flutter/material.dart';

import 'dio/dio_services.dart';

main(){
  DioHelper.init();
runApp(AppRoot());
}