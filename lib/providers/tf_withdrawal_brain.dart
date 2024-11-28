
import 'package:flutter/foundation.dart';

import 'db_helper.dart';
import 'increase_model.dart';

class TransactionBrain extends ChangeNotifier {

  final List<int> _transactions = [];

   final List<double> _increase = [];

  final List<int> _charges = [];

  List<Increase> _databaseTransactions = [];

  List<Increase> get databaseTransactions {
    return [..._databaseTransactions];
  }

  List<int> get transaction {
    return [..._transactions];
  }

  List<double> get increase {
    return [..._increase];
  }

  List<int> get charges {
    return [..._charges];
  }

  void saveToDb (){
    final newIncrease = Increase(id: DateTime.now().toString(), increaseAmount: sumOfIncreaseValue.toDouble());
    DBHelperTransfer.insert('transfer_increase', {
      'id': newIncrease.id,
      'increaseAmount': newIncrease.increaseAmount
    });
    notifyListeners();
  }

  Future<void> fetchAndSetData() async{
    final dbData = await DBHelperTransfer.getData('transfer_increase');
   _databaseTransactions = dbData.map((item) => Increase(id: item['id'], increaseAmount: item['increaseAmount'])).toList();
    notifyListeners();
}

  void addTransaction (int tx) {
    _transactions.add(tx);
    notifyListeners();
  }

  void addCharges (int charge) {
    _charges.add(charge);
    notifyListeners();
  }

  void addIncrease (double tx) {
    _increase.add(tx);
    notifyListeners();
  }

  void removeByDismissibleTransaction(var id) {
    _transactions.remove(id);
    notifyListeners();
  }

  void removeByDismissibleIncrease (var id) {
    _increase.remove(id);
    notifyListeners();
  }

  void removeByDismissibleCharges (var id) {
    _charges.remove(id);
    notifyListeners();
  }

  void removeTransaction() {
    if(_transactions.isEmpty) {
      return;
    }
    _transactions.removeLast();
    notifyListeners();
  }

  // void removeIncrease() {
  //   if(_transactions.isEmpty) {
  //     return;
  //   }
  //   _increase.removeLast();
  //   notifyListeners();
  // }

  double? calculateTransferWithdrawalIncrease (int amount) {
    if(amount < 20000) {
      return amount*0.005;
    }
    if (amount >= 20000){
      return 100;
    }
    return 100;
    // if (amount < 200) {
    //   return amount;
    // }
    // if (amount >= 200) {
    //   return amount - 50;
    // }
    // return 0;
  }



    double get sumOfIncreaseValue {
    double total = 0;
    for (var element in _increase) {
      total+= element;
    }
    return total;
    }


}



// int? calculateTransferWithdrawalIncrease (int amount) {
//   if(amount < 1000) {
//     return 50;
//   }
//   if (amount >= 1000 && amount <= 5000) {
//     return 100;
//   }
//   if (amount >= 5000 && amount <= 6999) {
//     return 120;
//   } if (amount >= 7000 && amount <= 7999) {
//     return 140;
//   }else {
//     return 200;
//   }
// }