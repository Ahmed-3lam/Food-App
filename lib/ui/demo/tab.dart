import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:stacked/stacked.dart';

class Master extends StatefulWidget {
  const Master({Key? key}) : super(key: key);

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MasterModel>.reactive(
      viewModelBuilder: () => MasterModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Demo Cart"),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Builder(builder: (context) {
              return ListTile(
                  onTap: () {
                    model.onTap(Product(image: "", name: "name", quant: 1));
                  },
                  selectedTileColor: kcBlack,
                  leading: Image.asset(pds[0].image),
                  title: Text(pds[0].name),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)));
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
      ),
    );
  }
}

List<Product> pds = <Product>[
  Product(image: "asset/images/home/fried.png", name: "Kaliyu", quant: 1),
];

class Product {
  Product({required this.image, required this.name, required this.quant});
  String image, name;

  int quant;
}

class MasterModel extends BaseViewModel {
  List<Product> pds = [];

  void onTap(Product p) {
    for (var product in pds) {
      if (product.name == p.name) {
        int x = product.quant;
        x++;
        product.quant = x;
        notifyListeners();
      } else {
        pds.add(p);
      }
    }
  }
}
