import 'package:flutter/cupertino.dart';
import 'package:mie_ayu_rawalumbu/models/bank_model.dart';
import 'package:mie_ayu_rawalumbu/models/courier_model.dart';

class TransactionProvider with ChangeNotifier {
  CourierModel? _courier;
  BankModel? _bank;
  BankModel? get bank => _bank;
  set courier(CourierModel? cours) {
    _courier = cours;
    notifyListeners();
  }

  CourierModel? get courier => _courier;
  set bank(BankModel? banks) {
    _bank = banks;
    notifyListeners();
  }

  getCourier(CourierModel cours) {
    var cour = CourierModel(
      name: cours.name,
      imageUrl: cours.imageUrl,
      price: cours.price,
      isIbnu: cours.isIbnu,
    );
    _courier = cour;
    print(_courier!.isIbnu);
    notifyListeners();
  }

  getBank(BankModel banks) {
    var bank = BankModel(
      name: banks.name,
      imageUrl: banks.imageUrl,
      price: banks.price,
    );
    _bank = bank;
    print(_bank);
    notifyListeners();
  }
}
