import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/models/dishmodel.dart';

class DeliveryPageModel extends ChangeNotifier {
  List<DishModel> _addedProduct = [];
  List<DishModel> get getProduct => _addedProduct;
  addProduct(DishModel product) {
    _addedProduct.add(product);
    notifyListeners();
  }
}

class DishModelWrapper extends ChangeNotifier {
  final DishModel dishModel;
  DishModelWrapper(this.dishModel);
  int _item = 0;
  int get value => _item;
}
