import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> isConnection();
}
class NetworkInfoImpl implements NetworkInfo{
InternetConnectionChecker internetConnectionChecker;

NetworkInfoImpl(this.internetConnectionChecker);

  @override
  Future<bool> isConnection() async{
    return await internetConnectionChecker.hasConnection;
  }

}