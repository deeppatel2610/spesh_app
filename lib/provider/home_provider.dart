import 'package:flutter/material.dart';
import 'package:spesh_app/model/solar_model.dart';

import '../JSON/data.dart';

class HomeProvider with ChangeNotifier {
  List<SolarModel> solarSystemData = [];

  // bool isValue = false;
  int boxIndex = 0;
  bool isAlie = false;

  void alieBox() {
    isAlie = !isAlie;
    notifyListeners();
  }

  void setBoxIndex(int index) {
    boxIndex = index;
    notifyListeners();
  }

  void getList() {
    solarSystemData = solarSystem.map((e) => SolarModel.fromMap(e)).toList();
    notifyListeners();
  }
}
