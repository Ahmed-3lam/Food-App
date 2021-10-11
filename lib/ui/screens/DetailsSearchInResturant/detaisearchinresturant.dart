import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/details/details.dart';

import 'compo/detailsearchiresturanttile.dart';

class DetailSearchInResturant extends StatefulWidget {
  const DetailSearchInResturant({Key? key}) : super(key: key);

  @override
  _DetailSearchInResturantState createState() =>
      _DetailSearchInResturantState();
}

class _DetailSearchInResturantState extends State<DetailSearchInResturant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Icon(
              MyFlutterApp.arrowback,
              color: Colors.black,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: SizedBox(
            height: 48,
            child: TxtField(
              filledColor: kcgrey3,
              hint: "Spaghetti",
              prefix: const Icon(
                MyFlutterApp.search,
                color: kcSearchColor,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: kpaddinghor20,
                  child: GestureDetector(
                    onTap: () {
                      RouteX.sliderBottomToTop(context, const Details());
                    },
                    child: DetailsSearchResultTile(
                        count: 2, onIncrase: () {}, onDecrase: () {}),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
