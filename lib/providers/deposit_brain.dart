
import 'package:flutter/foundation.dart';

import 'db_helper.dart';
import 'increase_model.dart';

class DepositBrain extends ChangeNotifier {

  final List<int> _deposit = [];
  final List<int> _increase = [];
  final List<int> _charges = [];

  List<Increase> _databaseTransactions = [];

  List<Increase> get databaseTransactions {
    return [..._databaseTransactions];
}


  List<int> get deposit {
    return [..._deposit];
  }

  List<int> get increase {
    return [..._increase];
  }

  List<int> get charges {
    return [..._charges];
  }

  void saveToDb(){
    final newIncrease = Increase(id: DateTime.now().toString(), increaseAmount: depositIncrease.toDouble());
    DBHelperDeposit.insert('deposit_increase', {
      'id': newIncrease.id,
      'increaseAmount': newIncrease.increaseAmount
    });
    notifyListeners();
  }

  Future<void> fetchAndSetData() async {
    final dbData = await DBHelperDeposit.getData('deposit_increase');
    _databaseTransactions = dbData.map((item) => Increase(id: item['id'], increaseAmount: item['increaseAmount'])).toList();
  }

  void addDeposit(int depo) {
    _deposit.add(depo);
    notifyListeners();
  }

  void addCharges(int charges) {
    _charges.add(charges);
    notifyListeners();
  }

  void addIncrease(int amount) {
    _increase.add(amount);
    notifyListeners();
  }

  int? calcProfit(int charges) {
    return charges - 20;
  }

  int get depositIncrease{
    int total = 0;
    for (var element in _increase) {
       total += element;
    }
    return total;
  }

  void removeFromList(){
    _deposit.removeLast();
    notifyListeners();
  }

  void removeTransDismissible(var id){
    _deposit.remove(id);
    notifyListeners();
  }

  void removeIncreaseDismissible(var id){
    _increase.remove(id);
    notifyListeners();
  }

  void removeChargesDismissible(var id){
    _increase.remove(id);
    notifyListeners();
  }


}