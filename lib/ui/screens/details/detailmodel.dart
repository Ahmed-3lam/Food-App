import 'package:flutter/material.dart';
import 'package:frontend/models/dishmodel.dart';

class DetailsModel extends ChangeNotifier {
  int value = 0;
  final List<DishModelWrapper> _addedProduct = <DishModelWrapper>[];
  List<DishModelWrapper> get getProduct => _addedProduct;
  addProduct(DishModel product) {
    for (DishModelWrapper item in _addedProduct) {
      if (item.dishModel.image == product.image) {
        item.incr();
        notifyListeners();
        return;
      }
    }

    _addedProduct.add(DishModelWrapper(product));
    notifyListeners();
  }

  removeProduct(DishModel product) {
    for (DishModelWrapper item in _addedProduct) {
      if (item.dishModel.image == product.image && item._item == 1) {
        _addedProduct
            .removeWhere((element) => element.dishModel.image == product.image);
        notifyListeners();
        item.dcr();
        notifyListeners();
        return;
      } else if (item.dishModel.image == product.image) {
        item.dcr();
        notifyListeners();
        return;
      }
    }
  }

  int totaitem() => _addedProduct.fold(
      0, (previousValue, element) => previousValue + element._item);
}

class DishModelWrapper {
  final DishModel dishModel;
  DishModelWrapper(this.dishModel);
  int _item = 1;
  incr() {
    _item++;
  }

  dcr() {
    _item--;
  }
}
