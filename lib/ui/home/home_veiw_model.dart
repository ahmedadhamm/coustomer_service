import 'package:flutter/cupertino.dart';

import '../../base/base.dart';
import '../../data_base/my_data_base.dart';
import '../../model/room.dart';

abstract class HomeNavigator extends BaseNavigator {}

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];

  void loadRooms() async {
    try {
      rooms = await MyDataBase.loadRooms();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

