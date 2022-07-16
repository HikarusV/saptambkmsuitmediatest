import 'package:flutter/material.dart';
import 'package:suitmediatest/common/state_enum.dart';
import 'package:suitmediatest/data/datasource/unsplash.dart';

import '../../data/models/user.dart';

class ThirdProvider with ChangeNotifier {
  bool isLoading = false;
  int page = 1;
  List dataUser = [];

  List<Users> _data = [];
  String _message = "default";
  ResultState _stateUsers = ResultState.noData;

  ResultState get stateUsers => _stateUsers;
  List<Users> get data => _data;
  String get message => _message;

  Widget loadingWidget = Container(
    height: 0.3,
    color: Colors.red,
  );

  Future fetchDataUser() async {
    _stateUsers = ResultState.loading;
    notifyListeners();

    try {
      final result = await Unsplash.getUser();
      if (!result['error']) {
        _data = result['data'];
        _message = result['message'];
        _stateUsers = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _message = e.toString();
      _stateUsers = ResultState.error;
      notifyListeners();
    }
  }

  Future fetchDataUserAfter() async {
    isLoading = true;
    loadingWidget = const Center(
      child: CircularProgressIndicator(),
    );
    notifyListeners();

    try {
      final result = await Unsplash.getUser(page: ++page);
      if (!result['error']) {
        _data.addAll(result['data']);
        _message = result['message'];
        _stateUsers = ResultState.hasData;
        isLoading = false;
        loadingWidget = Container(
          height: 0.3,
        );
        notifyListeners();
      }
    } catch (e) {
      _message = e.toString();
      _stateUsers = ResultState.error;
      isLoading = false;
      loadingWidget = Container(
        height: 0.3,
      );
      notifyListeners();
    }
  }
}
